import 'package:freezed_annotation/freezed_annotation.dart';

import 'exposure/exposure_coordinates.dart';
import 'focus/focus_coordinates.dart';

part 'camera_preview_model.freezed.dart';

@freezed
class CameraPreviewModel with _$CameraPreviewModel {
  factory CameraPreviewModel({
    required FocusCoordinates focusCoordinates,
    @Default(false) bool isFocusVisible,
    required ExposureCoordinates exposureCoordinates,
    @Default(0) double exposure,
    @Default(false) bool isCameraReady,
  }) = _CameraPreviewModel;
}
