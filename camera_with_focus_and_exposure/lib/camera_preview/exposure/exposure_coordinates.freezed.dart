// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exposure_coordinates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExposureCoordinates {
  dynamic get isUpdated => throw _privateConstructorUsedError;
  Position get position => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get exposureBarTopCoordinateY => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExposureCoordinatesCopyWith<ExposureCoordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExposureCoordinatesCopyWith<$Res> {
  factory $ExposureCoordinatesCopyWith(
          ExposureCoordinates value, $Res Function(ExposureCoordinates) then) =
      _$ExposureCoordinatesCopyWithImpl<$Res, ExposureCoordinates>;
  @useResult
  $Res call(
      {dynamic isUpdated,
      Position position,
      double x,
      double y,
      double exposureBarTopCoordinateY});
}

/// @nodoc
class _$ExposureCoordinatesCopyWithImpl<$Res, $Val extends ExposureCoordinates>
    implements $ExposureCoordinatesCopyWith<$Res> {
  _$ExposureCoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUpdated = null,
    Object? position = null,
    Object? x = null,
    Object? y = null,
    Object? exposureBarTopCoordinateY = null,
  }) {
    return _then(_value.copyWith(
      isUpdated: null == isUpdated
          ? _value.isUpdated
          : isUpdated // ignore: cast_nullable_to_non_nullable
              as dynamic,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      exposureBarTopCoordinateY: null == exposureBarTopCoordinateY
          ? _value.exposureBarTopCoordinateY
          : exposureBarTopCoordinateY // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExposureCoordinatesCopyWith<$Res>
    implements $ExposureCoordinatesCopyWith<$Res> {
  factory _$$_ExposureCoordinatesCopyWith(_$_ExposureCoordinates value,
          $Res Function(_$_ExposureCoordinates) then) =
      __$$_ExposureCoordinatesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic isUpdated,
      Position position,
      double x,
      double y,
      double exposureBarTopCoordinateY});
}

/// @nodoc
class __$$_ExposureCoordinatesCopyWithImpl<$Res>
    extends _$ExposureCoordinatesCopyWithImpl<$Res, _$_ExposureCoordinates>
    implements _$$_ExposureCoordinatesCopyWith<$Res> {
  __$$_ExposureCoordinatesCopyWithImpl(_$_ExposureCoordinates _value,
      $Res Function(_$_ExposureCoordinates) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUpdated = null,
    Object? position = null,
    Object? x = null,
    Object? y = null,
    Object? exposureBarTopCoordinateY = null,
  }) {
    return _then(_$_ExposureCoordinates(
      isUpdated: null == isUpdated ? _value.isUpdated : isUpdated,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      exposureBarTopCoordinateY: null == exposureBarTopCoordinateY
          ? _value.exposureBarTopCoordinateY
          : exposureBarTopCoordinateY // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ExposureCoordinates implements _ExposureCoordinates {
  _$_ExposureCoordinates(
      {this.isUpdated = false,
      this.position = Position.left,
      this.x = 0,
      this.y = 0,
      this.exposureBarTopCoordinateY = 0});

  @override
  @JsonKey()
  final dynamic isUpdated;
  @override
  @JsonKey()
  final Position position;
  @override
  @JsonKey()
  final double x;
  @override
  @JsonKey()
  final double y;
  @override
  @JsonKey()
  final double exposureBarTopCoordinateY;

  @override
  String toString() {
    return 'ExposureCoordinates(isUpdated: $isUpdated, position: $position, x: $x, y: $y, exposureBarTopCoordinateY: $exposureBarTopCoordinateY)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExposureCoordinates &&
            const DeepCollectionEquality().equals(other.isUpdated, isUpdated) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.exposureBarTopCoordinateY,
                    exposureBarTopCoordinateY) ||
                other.exposureBarTopCoordinateY == exposureBarTopCoordinateY));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isUpdated),
      position,
      x,
      y,
      exposureBarTopCoordinateY);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExposureCoordinatesCopyWith<_$_ExposureCoordinates> get copyWith =>
      __$$_ExposureCoordinatesCopyWithImpl<_$_ExposureCoordinates>(
          this, _$identity);
}

abstract class _ExposureCoordinates implements ExposureCoordinates {
  factory _ExposureCoordinates(
      {final dynamic isUpdated,
      final Position position,
      final double x,
      final double y,
      final double exposureBarTopCoordinateY}) = _$_ExposureCoordinates;

  @override
  dynamic get isUpdated;
  @override
  Position get position;
  @override
  double get x;
  @override
  double get y;
  @override
  double get exposureBarTopCoordinateY;
  @override
  @JsonKey(ignore: true)
  _$$_ExposureCoordinatesCopyWith<_$_ExposureCoordinates> get copyWith =>
      throw _privateConstructorUsedError;
}
