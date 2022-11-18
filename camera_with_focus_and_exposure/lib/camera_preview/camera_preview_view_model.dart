import 'dart:async';

import 'package:camera/camera.dart';
import 'package:camera_with_focus_and_exposure/camera_preview/exposure/exposure_coordinates.dart';
import 'package:camera_with_focus_and_exposure/camera_preview/focus/focus_coordinates.dart';
import 'package:camera_with_focus_and_exposure/camera_preview/widgets/focus_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'camera_preview_model.dart';

const _backCameraIndex = 0;
const _focusAutoHidingTime = 3000;
const _movementWeight = 10;

class CameraPreviewViewModel extends StateNotifier<CameraPreviewModel> {
  CameraPreviewViewModel()
      : super(
          CameraPreviewModel(
            focusCoordinates: FocusCoordinates(),
            exposureCoordinates: ExposureCoordinates(),
          ),
        ) {
    _hideStatusBar();
  }

  late final CameraController _cameraController;

  CameraController get cameraController => _cameraController;

  List<CameraDescription> _cameras = <CameraDescription>[];

  set cameras(List<CameraDescription> cameras) {
    _cameras = cameras;
  }

  Timer? _focusAutoHidingTimer;

  void _hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
    ]);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> initializeCamera() async {
    if (state.isCameraReady) {
      return;
    }
    _cameraController = CameraController(
      _cameras[_backCameraIndex],
      ResolutionPreset.max,
    );
    try {
      await _cameraController.initialize();

      /// 露出の最大許容値と最低許容値を取得する
      final minExposureValue = await _cameraController.getMinExposureOffset();
      final maxExposureValue = await _cameraController.getMaxExposureOffset();
      state = state.copyWith(
        isCameraReady: true,
        minExposureValue: minExposureValue,
        maxExposureValue: maxExposureValue,
      );
    } on CameraException catch (error) {
      debugPrint(error.toString());
    }
  }

  /// 状態を初期化する
  Future<void> onTapDown(TapDownDetails details) async {
    debugPrint('【onTapDown】');
    final focusCenterCoordinateY =
        state.focusCoordinates.y - (focusWidgetSize / 2);
    final exposureBarTopCoordinateY =
        focusCenterCoordinateY - (focusWidgetSize / 2);

    state = state.copyWith(
      exposureCoordinates: state.exposureCoordinates.copyWith(
        isUpdated: false,
        exposureBarTopCoordinateY: exposureBarTopCoordinateY,
      ),
    );

    final error = await _tryOrSetExposureOffsetOnDevice(0);
    if (error != null) {
      debugPrint(error.toString());
      return;
    }
    state = state.copyWith(
      currentExposureValue: 0,
    );
  }

  void onLongPressStart(LongPressStartDetails details, BuildContext context) {
    debugPrint(
        '【onLongPressStart】positionX: ${details.globalPosition.dx}, positionY: ${details.globalPosition.dy}');
    _updateFocusCoordinates(
      newCoordinateX: details.globalPosition.dx,
      newCoordinateY: details.globalPosition.dy,
    );
    _setFocusPointOnDevice(
      distanceX: details.globalPosition.dx,
      distanceY: details.globalPosition.dy,
      context: context,
    );
    _hideFocusAfterSeconds();
  }

  Future<void> onTapUp(TapUpDetails details, BuildContext context) async {
    debugPrint(
        '【onTapUp】positionX: ${details.globalPosition.dx}, positionY: ${details.globalPosition.dy}');
    final error = await _setFocusPointOnDevice(
      distanceX: details.globalPosition.dx,
      distanceY: details.globalPosition.dy,
      context: context,
    );
    if (error != null) {
      debugPrint(error.toString());
    } else {
      _updateFocusCoordinates(
        newCoordinateX: details.globalPosition.dx,
        newCoordinateY: details.globalPosition.dy,
      );
    }

    _hideFocusAfterSeconds();
  }

  Future<CameraException?> _setFocusPointOnDevice({
    required double distanceX,
    required double distanceY,
    required BuildContext context,
  }) async {
    final size = MediaQuery.of(context).size;
    try {
      await _cameraController.setFocusPoint(
        Offset(
          distanceX / size.width,
          distanceY / size.height,
        ),
      );
    } on CameraException catch (error) {
      return error;
    }
    return null;
  }

  void _updateFocusCoordinates({
    required double newCoordinateX,
    required double newCoordinateY,
  }) {
    if (state.exposureCoordinates.isUpdated) {
      _hideFocusAfterSeconds();
      return;
    }

    final isTappedRightFourthScreen =
        _isTappedRightFourthScreen(newCoordinateX);

    state = state.copyWith(
      isFocusVisible: true,
      focusCoordinates: state.focusCoordinates.copyWith(
        x: newCoordinateX,
        y: newCoordinateY,
      ),
      exposureCoordinates: state.exposureCoordinates.copyWith(
        /// 露出調整アイコンを初期位置に戻す
        y: exposureCoordinatorBarHeight / 2,

        /// スクリーン上でタップされた場所によって、露出調整バーの表示する左右の側を決める
        /// 左側をタップされた場合: 露出調整バーをフォーカス右側に表示する
        /// 右側をタップされた場合: 露出調整バーをフォーカス左側に表示する
        position: isTappedRightFourthScreen ? Position.left : Position.right,
      ),
    );
  }

  Future<void> onVerticalDragUpdate(DragUpdateDetails details) async {
    /// フォーカスが表示されていない場合は、露出変更はできない
    if (!state.isFocusVisible) {
      return;
    }

    /// タイマーが起動していた場合には、キャンセルする
    if (_focusAutoHidingTimer != null) {
      _focusAutoHidingTimer?.cancel();
    }
    debugPrint(
        '【onPointerMove】positionX: ${details.globalPosition.dx}, positionY: ${details.globalPosition.dy}');

    /// 重み付きの移動距離
    /// Delta:
    /// The amount the pointer has moved in the coordinate space of the event
    /// receiver since the previous update.
    final movingDistanceY = details.delta.dy / _movementWeight;

    final error = await _tryOrSetExposureOffsetOnDevice(movingDistanceY);
    if (error != null) {
      debugPrint(error.toString());
    } else {
      _updateExposureCoordinates(movingDistanceY);
    }
    _hideFocusAfterSeconds();
  }

  void _updateExposureCoordinates(double movingDistanceY) {
    final currentExposureCoordinateY = state.exposureCoordinates.y;
    final newCoordinateY = currentExposureCoordinateY + movingDistanceY;
    if (newCoordinateY < 0 || exposureCoordinatorBarHeight < newCoordinateY) {
      return;
    }

    state = state.copyWith(
      exposureCoordinates: state.exposureCoordinates.copyWith(
        isUpdated: true,
        y: newCoordinateY,
      ),
    );
  }

  Future<CameraException?> _tryOrSetExposureOffsetOnDevice(
    double movingDistanceY,
  ) async {
    double relativeWeight = 0;

    /// 露出アイコンが上部に移動する場合、movingDistanceY は負数になる
    final isMovingUp = movingDistanceY <= 0.0;
    const distanceToEdge = exposureCoordinatorBarHeight / 2;
    if (isMovingUp) {
      relativeWeight = distanceToEdge / state.maxExposureValue;
    } else {
      relativeWeight = distanceToEdge / state.minExposureValue;
    }

    final movingExposureValue = -movingDistanceY / relativeWeight;
    final newExposureValue = state.currentExposureValue + movingExposureValue;

    final isNewExposureValueWithinAvailableRange =
        (state.minExposureValue <= newExposureValue) &&
            (newExposureValue <= state.maxExposureValue);
    if (!isNewExposureValueWithinAvailableRange) {
      return CameraException(
        'setExposurePointFailed',
        'Given value could cause overflow.',
      );
    }

    try {
      await _cameraController.setExposureOffset(newExposureValue);
    } on CameraException catch (error) {
      return error;
    }
    state = state.copyWith(
      currentExposureValue: newExposureValue,
    );
    return null;
  }

  /// スクリーンの右側部をタップされたかを判定する
  bool _isTappedRightFourthScreen(double positionX) {
    final pixelRatio = WidgetsBinding.instance.window.devicePixelRatio;
    final logicalScreenSize =
        WidgetsBinding.instance.window.physicalSize / pixelRatio;
    final logicalWidth = logicalScreenSize.width;
    final fourthLogicalWidth = logicalWidth / 4;
    final rightFourthLogicalWidth = logicalWidth - fourthLogicalWidth;

    if (rightFourthLogicalWidth <= positionX) {
      return true;
    }
    return false;
  }

  void _hideFocusAfterSeconds() {
    if (_focusAutoHidingTimer != null) {
      _focusAutoHidingTimer?.cancel();
    }
    _focusAutoHidingTimer =
        Timer(const Duration(milliseconds: _focusAutoHidingTime), () {
      state = state.copyWith(
        isFocusVisible: false,
      );
    });
  }
}
