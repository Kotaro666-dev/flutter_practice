import 'dart:async';

import 'package:camera/camera.dart';
import 'package:camera_with_focus_and_exposure/camera_preview/exposure/exposure_model.dart';
import 'package:camera_with_focus_and_exposure/camera_preview/focus/focus_model.dart';
import 'package:camera_with_focus_and_exposure/camera_preview/widgets/focus_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'camera_preview_model.dart';

const _backCameraIndex = 0;
const _focusAutoHidingTimeInMilliseconds = 3000;
const _movementWeight = 10;

class CameraPreviewViewModel extends StateNotifier<CameraPreviewModel> {
  CameraPreviewViewModel()
      : super(
          CameraPreviewModel(
            focusModel: FocusModel(),
            exposureModel: ExposureModel(),
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
      final minValue = await _cameraController.getMinExposureOffset();
      final maxValue = await _cameraController.getMaxExposureOffset();
      state = state.copyWith(
        isCameraReady: true,
        exposureModel: state.exposureModel.copyWith(
          minValue: minValue,
          maxValue: maxValue,
        ),
      );
    } on CameraException catch (error) {
      debugPrint(error.toString());
    }
  }

  /// スクリーン上でタップされた時のイベントに呼ばれるコールバック関数
  /// 状態を初期化する
  Future<void> onTapDown(TapDownDetails details) async {
    debugPrint('【onTapDown】');
    final focusCenterCoordinateY =
        state.focusModel.coordinateY - (focusWidgetSize / 2);
    final exposureBarTopCoordinateY =
        focusCenterCoordinateY - (focusWidgetSize / 2);

    state = state.copyWith(
      exposureModel: state.exposureModel.copyWith(
        isUpdated: false,
        barTopCoordinateY: exposureBarTopCoordinateY,
      ),
    );

    final error = await _tryOrSetExposureOffsetOnDevice(0);
    if (error != null) {
      debugPrint(error.toString());
      return;
    }
    state = state.copyWith(
      exposureModel: state.exposureModel.copyWith(
        currentValue: 0,
      ),
    );
  }

  /// タップされたスクリーンとの接地が終了したイベントに呼ばれるコールバック関数
  /// ネイティブで管理するフォーカス地点と Flutter 上で描写されるフォーカス位置の設定をする
  Future<void> onTapUp(TapUpDetails details, BuildContext context) async {
    debugPrint(
        '【onTapUp】positionX: ${details.globalPosition.dx}, positionY: ${details.globalPosition.dy}');
    await _setFocus(
      distanceX: details.globalPosition.dx,
      distanceY: details.globalPosition.dy,
      context: context,
    );

    _hideFocusAfterSeconds();
  }

  /// ロングプレス押下イベントに呼ばれるコールバック関数
  /// フォーカス地点のネイティブと描写される位置の設定をする
  Future<void> onLongPressStart(
    LongPressStartDetails details,
    BuildContext context,
  ) async {
    debugPrint(
        '【onLongPressStart】positionX: ${details.globalPosition.dx}, positionY: ${details.globalPosition.dy}');

    await _setFocus(
      distanceX: details.globalPosition.dx,
      distanceY: details.globalPosition.dy,
      context: context,
    );

    _hideFocusAfterSeconds();
  }

  Future<void> _setFocus({
    required double distanceX,
    required double distanceY,
    required BuildContext context,
  }) async {
    final error = await _setFocusPointOnDevice(
      distanceX: distanceX,
      distanceY: distanceY,
      context: context,
    );
    if (error != null) {
      debugPrint(error.toString());
      return;
    }

    _updateFocusCoordinates(
      newCoordinateX: distanceX,
      newCoordinateY: distanceY,
    );
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
    if (state.exposureModel.isUpdated) {
      _hideFocusAfterSeconds();
      return;
    }

    final isTappedRightFourthScreen =
        _isTappedRightFourthScreen(newCoordinateX);

    state = state.copyWith(
      focusModel: state.focusModel.copyWith(
        isVisible: true,
        coordinateX: newCoordinateX,
        coordinateY: newCoordinateY,
      ),
      exposureModel: state.exposureModel.copyWith(
        /// 露出調整アイコンを初期位置に戻す
        coordinateY: exposureCoordinatorBarHeight / 2,

        /// スクリーン上でタップされた場所によって、露出調整バーの表示する左右の側を決める
        /// 左側をタップされた場合: 露出調整バーをフォーカス右側に表示する
        /// 右側をタップされた場合: 露出調整バーをフォーカス左側に表示する
        position: isTappedRightFourthScreen ? Position.left : Position.right,
      ),
    );
  }

  /// 垂直方向のドラッグ移動イベントに呼ばれるコールバック関数
  /// ネイティブで管理する露出値と Flutter 上で描写される露出座標位置の設定をする
  Future<void> onVerticalDragUpdate(DragUpdateDetails details) async {
    /// フォーカスが表示されていない場合は、露出変更はできない
    if (!state.focusModel.isVisible) {
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
    final currentExposureCoordinateY = state.exposureModel.coordinateY;
    final newCoordinateY = currentExposureCoordinateY + movingDistanceY;
    if (newCoordinateY < 0 || exposureCoordinatorBarHeight < newCoordinateY) {
      return;
    }

    state = state.copyWith(
      exposureModel: state.exposureModel.copyWith(
        isUpdated: true,
        coordinateY: newCoordinateY,
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
      relativeWeight = distanceToEdge / (state.exposureModel.maxValue).abs();
    } else {
      relativeWeight = distanceToEdge / (state.exposureModel.minValue).abs();
    }

    final movingExposureValue = -movingDistanceY / relativeWeight;
    final newExposureValue =
        state.exposureModel.currentValue + movingExposureValue;

    final isNewExposureValueWithinAvailableRange =
        (state.exposureModel.minValue <= newExposureValue) &&
            (newExposureValue <= state.exposureModel.maxValue);
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
      exposureModel: state.exposureModel.copyWith(
        currentValue: newExposureValue,
      ),
    );
    return null;
  }

  /// スクリーンの右側部をタップされたかを判定する
  /// なぜ？: タップされた位置に応じて、表示する露出バーの位置を変更する必要があるため
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
    _focusAutoHidingTimer = Timer(
      const Duration(milliseconds: _focusAutoHidingTimeInMilliseconds),
      () {
        state = state.copyWith(
          focusModel: state.focusModel.copyWith(
            isVisible: false,
          ),
        );
      },
    );
  }
}
