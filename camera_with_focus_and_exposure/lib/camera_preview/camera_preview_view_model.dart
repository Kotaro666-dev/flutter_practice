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
      ResolutionPreset.medium,
    );
    try {
      await _cameraController.initialize();
      state = state.copyWith(
        isCameraReady: true,
      );
    } on CameraException catch (error) {
      debugPrint(error.toString());
    }
  }

  void onPointerDown(PointerEvent details) {
    debugPrint('【onPointerDown】');
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
  }

  void onPointerUpUpdateFocusCoordinates(PointerEvent details) {
    debugPrint(
        '【onPointerUpdate】positionX: ${details.position.dx}, positionY: ${details.position.dy}');
    if (state.exposureCoordinates.isUpdated) {
      _hideFocusAfterSeconds();
      return;
    }

    final newCoordinateX = details.position.dx;
    final newCoordinateY = details.position.dy;
    final isTappedRightFourthScreen =
        _isTappedRightFourthScreen(details.position.dx);

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

    _hideFocusAfterSeconds();
  }

  void onPointerMoveUpdateExposureCoordinates(PointerEvent details) {
    debugPrint(
        '【onPointerMove】positionX: ${details.position.dx}, positionY: ${details.position.dy}');
    if (!state.isFocusVisible) {
      return;
    }
    if (_focusAutoHidingTimer != null) {
      _focusAutoHidingTimer?.cancel();
    }

    final currentExposureCoordinateY = state.exposureCoordinates.y;
    final movementY = details.delta.dy / _movementWeight;
    final newCoordinateY = currentExposureCoordinateY + movementY;
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
