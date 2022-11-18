import 'package:freezed_annotation/freezed_annotation.dart';

part 'exposure_coordinates.freezed.dart';

enum Position {
  left,
  right,
}

@freezed
class ExposureCoordinates with _$ExposureCoordinates {
  factory ExposureCoordinates({
    @Default(false) isUpdated,
    @Default(Position.left) Position position,
    @Default(0) double x,
    @Default(0) double y,
    @Default(0) double exposureBarTopCoordinateY,
  }) = _ExposureCoordinates;
}
