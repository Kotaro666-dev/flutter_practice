import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_comment.freezed.dart';

@freezed
class UserComment with _$UserComment {
  factory UserComment({
    @Default('') String user,
    @Default('') String body,
  }) = _UserComment;
}
