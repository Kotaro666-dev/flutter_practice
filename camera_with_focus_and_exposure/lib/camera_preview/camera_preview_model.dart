import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_preview_model.freezed.dart';

@freezed
class CameraPreviewModel with _$CameraPreviewModel {
  factory CameraPreviewModel({
    @Default(0) double focusPositionX,
    @Default(0) double focusPositionY,
    @Default(0) double exposure,
    @Default(false) bool isCameraReady,
  }) = _CameraPreviewModel;
}
