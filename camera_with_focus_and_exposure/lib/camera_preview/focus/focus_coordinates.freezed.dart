// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'focus_coordinates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FocusCoordinates {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FocusCoordinatesCopyWith<FocusCoordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FocusCoordinatesCopyWith<$Res> {
  factory $FocusCoordinatesCopyWith(
          FocusCoordinates value, $Res Function(FocusCoordinates) then) =
      _$FocusCoordinatesCopyWithImpl<$Res, FocusCoordinates>;
  @useResult
  $Res call({double x, double y});
}

/// @nodoc
class _$FocusCoordinatesCopyWithImpl<$Res, $Val extends FocusCoordinates>
    implements $FocusCoordinatesCopyWith<$Res> {
  _$FocusCoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FocusCoordinatesCopyWith<$Res>
    implements $FocusCoordinatesCopyWith<$Res> {
  factory _$$_FocusCoordinatesCopyWith(
          _$_FocusCoordinates value, $Res Function(_$_FocusCoordinates) then) =
      __$$_FocusCoordinatesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y});
}

/// @nodoc
class __$$_FocusCoordinatesCopyWithImpl<$Res>
    extends _$FocusCoordinatesCopyWithImpl<$Res, _$_FocusCoordinates>
    implements _$$_FocusCoordinatesCopyWith<$Res> {
  __$$_FocusCoordinatesCopyWithImpl(
      _$_FocusCoordinates _value, $Res Function(_$_FocusCoordinates) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$_FocusCoordinates(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_FocusCoordinates implements _FocusCoordinates {
  _$_FocusCoordinates({this.x = 0, this.y = 0});

  @override
  @JsonKey()
  final double x;
  @override
  @JsonKey()
  final double y;

  @override
  String toString() {
    return 'FocusCoordinates(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FocusCoordinates &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FocusCoordinatesCopyWith<_$_FocusCoordinates> get copyWith =>
      __$$_FocusCoordinatesCopyWithImpl<_$_FocusCoordinates>(this, _$identity);
}

abstract class _FocusCoordinates implements FocusCoordinates {
  factory _FocusCoordinates({final double x, final double y}) =
      _$_FocusCoordinates;

  @override
  double get x;
  @override
  double get y;
  @override
  @JsonKey(ignore: true)
  _$$_FocusCoordinatesCopyWith<_$_FocusCoordinates> get copyWith =>
      throw _privateConstructorUsedError;
}
