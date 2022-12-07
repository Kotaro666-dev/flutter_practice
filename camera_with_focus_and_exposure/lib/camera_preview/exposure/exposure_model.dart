import 'package:freezed_annotation/freezed_annotation.dart';

part 'exposure_model.freezed.dart';

enum Position {
  left,
  right,
}

@freezed
class ExposureModel with _$ExposureModel {
  factory ExposureModel({
    @Default(false) isUpdated,
    @Default(Position.left) Position position,
    @Default(0) double coordinateX,
    @Default(0) double coordinateY,
    @Default(0) double currentValue,
    @Default(0) double minValue,
    @Default(0) double maxValue,
  }) = _ExposureModel;
}
