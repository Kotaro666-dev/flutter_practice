import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_coordinates.freezed.dart';

@freezed
class FocusCoordinates with _$FocusCoordinates {
  factory FocusCoordinates({
    @Default(0) double x,
    @Default(0) double y,
  }) = _FocusCoordinates;
}
