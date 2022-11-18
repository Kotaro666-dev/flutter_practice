import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_model.freezed.dart';

@freezed
class FocusModel with _$FocusModel {
  factory FocusModel({
    @Default(0) double coordinateX,
    @Default(0) double coordinateY,
    @Default(false) bool isVisible,
  }) = _FocusModel;
}
