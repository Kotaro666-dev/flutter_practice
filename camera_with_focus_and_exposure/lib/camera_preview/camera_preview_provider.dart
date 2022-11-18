import 'package:camera_with_focus_and_exposure/camera_preview/camera_preview_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'camera_preview_model.dart';

final cameraPreviewProvider =
    StateNotifierProvider<CameraPreviewViewModel, CameraPreviewModel>((ref) {
  return CameraPreviewViewModel();
});
