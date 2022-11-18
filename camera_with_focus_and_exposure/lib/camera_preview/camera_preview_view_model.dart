import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'camera_preview_model.dart';

const backCameraIndex = 0;

class CameraPreviewViewModel extends StateNotifier<CameraPreviewModel> {
  CameraPreviewViewModel()
      : super(
          CameraPreviewModel(
            focusPositionX: 0,
            focusPositionY: 0,
            exposure: 0,
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
      _cameras[backCameraIndex],
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
}
