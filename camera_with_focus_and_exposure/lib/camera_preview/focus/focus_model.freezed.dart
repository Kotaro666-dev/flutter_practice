// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'focus_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FocusModel {
  double get coordinateX => throw _privateConstructorUsedError;
  double get coordinateY => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FocusModelCopyWith<FocusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FocusModelCopyWith<$Res> {
  factory $FocusModelCopyWith(
          FocusModel value, $Res Function(FocusModel) then) =
      _$FocusModelCopyWithImpl<$Res, FocusModel>;
  @useResult
  $Res call({double coordinateX, double coordinateY, bool isVisible});
}

/// @nodoc
class _$FocusModelCopyWithImpl<$Res, $Val extends FocusModel>
    implements $FocusModelCopyWith<$Res> {
  _$FocusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinateX = null,
    Object? coordinateY = null,
    Object? isVisible = null,
  }) {
    return _then(_value.copyWith(
      coordinateX: null == coordinateX
          ? _value.coordinateX
          : coordinateX // ignore: cast_nullable_to_non_nullable
              as double,
      coordinateY: null == coordinateY
          ? _value.coordinateY
          : coordinateY // ignore: cast_nullable_to_non_nullable
              as double,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FocusModelCopyWith<$Res>
    implements $FocusModelCopyWith<$Res> {
  factory _$$_FocusModelCopyWith(
          _$_FocusModel value, $Res Function(_$_FocusModel) then) =
      __$$_FocusModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double coordinateX, double coordinateY, bool isVisible});
}

/// @nodoc
class __$$_FocusModelCopyWithImpl<$Res>
    extends _$FocusModelCopyWithImpl<$Res, _$_FocusModel>
    implements _$$_FocusModelCopyWith<$Res> {
  __$$_FocusModelCopyWithImpl(
      _$_FocusModel _value, $Res Function(_$_FocusModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinateX = null,
    Object? coordinateY = null,
    Object? isVisible = null,
  }) {
    return _then(_$_FocusModel(
      coordinateX: null == coordinateX
          ? _value.coordinateX
          : coordinateX // ignore: cast_nullable_to_non_nullable
              as double,
      coordinateY: null == coordinateY
          ? _value.coordinateY
          : coordinateY // ignore: cast_nullable_to_non_nullable
              as double,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FocusModel implements _FocusModel {
  _$_FocusModel(
      {this.coordinateX = 0, this.coordinateY = 0, this.isVisible = false});

  @override
  @JsonKey()
  final double coordinateX;
  @override
  @JsonKey()
  final double coordinateY;
  @override
  @JsonKey()
  final bool isVisible;

  @override
  String toString() {
    return 'FocusModel(coordinateX: $coordinateX, coordinateY: $coordinateY, isVisible: $isVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FocusModel &&
            (identical(other.coordinateX, coordinateX) ||
                other.coordinateX == coordinateX) &&
            (identical(other.coordinateY, coordinateY) ||
                other.coordinateY == coordinateY) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, coordinateX, coordinateY, isVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FocusModelCopyWith<_$_FocusModel> get copyWith =>
      __$$_FocusModelCopyWithImpl<_$_FocusModel>(this, _$identity);
}

abstract class _FocusModel implements FocusModel {
  factory _FocusModel(
      {final double coordinateX,
      final double coordinateY,
      final bool isVisible}) = _$_FocusModel;

  @override
  double get coordinateX;
  @override
  double get coordinateY;
  @override
  bool get isVisible;
  @override
  @JsonKey(ignore: true)
  _$$_FocusModelCopyWith<_$_FocusModel> get copyWith =>
      throw _privateConstructorUsedError;
}
