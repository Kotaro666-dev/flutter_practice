import 'package:freezed_annotation/freezed_annotation.dart';

import 'exposure/exposure_model.dart';
import 'focus/focus_model.dart';

part 'camera_preview_model.freezed.dart';

@freezed
class CameraPreviewModel with _$CameraPreviewModel {
  factory CameraPreviewModel({
    required FocusModel focusModel,
    required ExposureModel exposureModel,
    @Default(false) bool isCameraReady,
  }) = _CameraPreviewModel;
}
