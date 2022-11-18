// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exposure_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExposureModel {
  dynamic get isUpdated => throw _privateConstructorUsedError;
  Position get position => throw _privateConstructorUsedError;
  double get coordinateX => throw _privateConstructorUsedError;
  double get coordinateY => throw _privateConstructorUsedError;
  double get barTopCoordinateY => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  double get minValue => throw _privateConstructorUsedError;
  double get maxValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExposureModelCopyWith<ExposureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExposureModelCopyWith<$Res> {
  factory $ExposureModelCopyWith(
          ExposureModel value, $Res Function(ExposureModel) then) =
      _$ExposureModelCopyWithImpl<$Res, ExposureModel>;
  @useResult
  $Res call(
      {dynamic isUpdated,
      Position position,
      double coordinateX,
      double coordinateY,
      double barTopCoordinateY,
      double currentValue,
      double minValue,
      double maxValue});
}

/// @nodoc
class _$ExposureModelCopyWithImpl<$Res, $Val extends ExposureModel>
    implements $ExposureModelCopyWith<$Res> {
  _$ExposureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUpdated = null,
    Object? position = null,
    Object? coordinateX = null,
    Object? coordinateY = null,
    Object? barTopCoordinateY = null,
    Object? currentValue = null,
    Object? minValue = null,
    Object? maxValue = null,
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
      coordinateX: null == coordinateX
          ? _value.coordinateX
          : coordinateX // ignore: cast_nullable_to_non_nullable
              as double,
      coordinateY: null == coordinateY
          ? _value.coordinateY
          : coordinateY // ignore: cast_nullable_to_non_nullable
              as double,
      barTopCoordinateY: null == barTopCoordinateY
          ? _value.barTopCoordinateY
          : barTopCoordinateY // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      minValue: null == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExposureModelCopyWith<$Res>
    implements $ExposureModelCopyWith<$Res> {
  factory _$$_ExposureModelCopyWith(
          _$_ExposureModel value, $Res Function(_$_ExposureModel) then) =
      __$$_ExposureModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic isUpdated,
      Position position,
      double coordinateX,
      double coordinateY,
      double barTopCoordinateY,
      double currentValue,
      double minValue,
      double maxValue});
}

/// @nodoc
class __$$_ExposureModelCopyWithImpl<$Res>
    extends _$ExposureModelCopyWithImpl<$Res, _$_ExposureModel>
    implements _$$_ExposureModelCopyWith<$Res> {
  __$$_ExposureModelCopyWithImpl(
      _$_ExposureModel _value, $Res Function(_$_ExposureModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUpdated = null,
    Object? position = null,
    Object? coordinateX = null,
    Object? coordinateY = null,
    Object? barTopCoordinateY = null,
    Object? currentValue = null,
    Object? minValue = null,
    Object? maxValue = null,
  }) {
    return _then(_$_ExposureModel(
      isUpdated: null == isUpdated ? _value.isUpdated : isUpdated,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      coordinateX: null == coordinateX
          ? _value.coordinateX
          : coordinateX // ignore: cast_nullable_to_non_nullable
              as double,
      coordinateY: null == coordinateY
          ? _value.coordinateY
          : coordinateY // ignore: cast_nullable_to_non_nullable
              as double,
      barTopCoordinateY: null == barTopCoordinateY
          ? _value.barTopCoordinateY
          : barTopCoordinateY // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      minValue: null == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ExposureModel implements _ExposureModel {
  _$_ExposureModel(
      {this.isUpdated = false,
      this.position = Position.left,
      this.coordinateX = 0,
      this.coordinateY = 0,
      this.barTopCoordinateY = 0,
      this.currentValue = 0,
      this.minValue = 0,
      this.maxValue = 0});

  @override
  @JsonKey()
  final dynamic isUpdated;
  @override
  @JsonKey()
  final Position position;
  @override
  @JsonKey()
  final double coordinateX;
  @override
  @JsonKey()
  final double coordinateY;
  @override
  @JsonKey()
  final double barTopCoordinateY;
  @override
  @JsonKey()
  final double currentValue;
  @override
  @JsonKey()
  final double minValue;
  @override
  @JsonKey()
  final double maxValue;

  @override
  String toString() {
    return 'ExposureModel(isUpdated: $isUpdated, position: $position, coordinateX: $coordinateX, coordinateY: $coordinateY, barTopCoordinateY: $barTopCoordinateY, currentValue: $currentValue, minValue: $minValue, maxValue: $maxValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExposureModel &&
            const DeepCollectionEquality().equals(other.isUpdated, isUpdated) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.coordinateX, coordinateX) ||
                other.coordinateX == coordinateX) &&
            (identical(other.coordinateY, coordinateY) ||
                other.coordinateY == coordinateY) &&
            (identical(other.barTopCoordinateY, barTopCoordinateY) ||
                other.barTopCoordinateY == barTopCoordinateY) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isUpdated),
      position,
      coordinateX,
      coordinateY,
      barTopCoordinateY,
      currentValue,
      minValue,
      maxValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExposureModelCopyWith<_$_ExposureModel> get copyWith =>
      __$$_ExposureModelCopyWithImpl<_$_ExposureModel>(this, _$identity);
}

abstract class _ExposureModel implements ExposureModel {
  factory _ExposureModel(
      {final dynamic isUpdated,
      final Position position,
      final double coordinateX,
      final double coordinateY,
      final double barTopCoordinateY,
      final double currentValue,
      final double minValue,
      final double maxValue}) = _$_ExposureModel;

  @override
  dynamic get isUpdated;
  @override
  Position get position;
  @override
  double get coordinateX;
  @override
  double get coordinateY;
  @override
  double get barTopCoordinateY;
  @override
  double get currentValue;
  @override
  double get minValue;
  @override
  double get maxValue;
  @override
  @JsonKey(ignore: true)
  _$$_ExposureModelCopyWith<_$_ExposureModel> get copyWith =>
      throw _privateConstructorUsedError;
}
