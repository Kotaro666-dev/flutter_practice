import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_comment/user_comment.dart';

part 'home.freezed.dart';

@freezed
class Home with _$Home {
  factory Home({
    @Default('') String title,
    @Default('') String author,
    @Default([]) List<UserComment> comments,
    @Default(0) double rates,
    @Default(2000) int year,
    @Default(false) bool isFavorite,
  }) = _Home;
}
