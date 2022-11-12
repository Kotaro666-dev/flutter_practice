// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserComment {
  String get user => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCommentCopyWith<UserComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCommentCopyWith<$Res> {
  factory $UserCommentCopyWith(
          UserComment value, $Res Function(UserComment) then) =
      _$UserCommentCopyWithImpl<$Res, UserComment>;
  @useResult
  $Res call({String user, String body});
}

/// @nodoc
class _$UserCommentCopyWithImpl<$Res, $Val extends UserComment>
    implements $UserCommentCopyWith<$Res> {
  _$UserCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? body = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCommentCopyWith<$Res>
    implements $UserCommentCopyWith<$Res> {
  factory _$$_UserCommentCopyWith(
          _$_UserComment value, $Res Function(_$_UserComment) then) =
      __$$_UserCommentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String user, String body});
}

/// @nodoc
class __$$_UserCommentCopyWithImpl<$Res>
    extends _$UserCommentCopyWithImpl<$Res, _$_UserComment>
    implements _$$_UserCommentCopyWith<$Res> {
  __$$_UserCommentCopyWithImpl(
      _$_UserComment _value, $Res Function(_$_UserComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? body = null,
  }) {
    return _then(_$_UserComment(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserComment implements _UserComment {
  _$_UserComment({this.user = '', this.body = ''});

  @override
  @JsonKey()
  final String user;
  @override
  @JsonKey()
  final String body;

  @override
  String toString() {
    return 'UserComment(user: $user, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserComment &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCommentCopyWith<_$_UserComment> get copyWith =>
      __$$_UserCommentCopyWithImpl<_$_UserComment>(this, _$identity);
}

abstract class _UserComment implements UserComment {
  factory _UserComment({final String user, final String body}) = _$_UserComment;

  @override
  String get user;
  @override
  String get body;
  @override
  @JsonKey(ignore: true)
  _$$_UserCommentCopyWith<_$_UserComment> get copyWith =>
      throw _privateConstructorUsedError;
}
