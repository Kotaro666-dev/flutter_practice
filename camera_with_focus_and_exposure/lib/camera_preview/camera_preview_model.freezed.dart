// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'camera_preview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CameraPreviewModel {
  double get focusPositionX => throw _privateConstructorUsedError;
  double get focusPositionY => throw _privateConstructorUsedError;
  double get exposure => throw _privateConstructorUsedError;
  bool get isCameraReady => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CameraPreviewModelCopyWith<CameraPreviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraPreviewModelCopyWith<$Res> {
  factory $CameraPreviewModelCopyWith(
          CameraPreviewModel value, $Res Function(CameraPreviewModel) then) =
      _$CameraPreviewModelCopyWithImpl<$Res, CameraPreviewModel>;
  @useResult
  $Res call(
      {double focusPositionX,
      double focusPositionY,
      double exposure,
      bool isCameraReady});
}

/// @nodoc
class _$CameraPreviewModelCopyWithImpl<$Res, $Val extends CameraPreviewModel>
    implements $CameraPreviewModelCopyWith<$Res> {
  _$CameraPreviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusPositionX = null,
    Object? focusPositionY = null,
    Object? exposure = null,
    Object? isCameraReady = null,
  }) {
    return _then(_value.copyWith(
      focusPositionX: null == focusPositionX
          ? _value.focusPositionX
          : focusPositionX // ignore: cast_nullable_to_non_nullable
              as double,
      focusPositionY: null == focusPositionY
          ? _value.focusPositionY
          : focusPositionY // ignore: cast_nullable_to_non_nullable
              as double,
      exposure: null == exposure
          ? _value.exposure
          : exposure // ignore: cast_nullable_to_non_nullable
              as double,
      isCameraReady: null == isCameraReady
          ? _value.isCameraReady
          : isCameraReady // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CameraPreviewModelCopyWith<$Res>
    implements $CameraPreviewModelCopyWith<$Res> {
  factory _$$_CameraPreviewModelCopyWith(_$_CameraPreviewModel value,
          $Res Function(_$_CameraPreviewModel) then) =
      __$$_CameraPreviewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double focusPositionX,
      double focusPositionY,
      double exposure,
      bool isCameraReady});
}

/// @nodoc
class __$$_CameraPreviewModelCopyWithImpl<$Res>
    extends _$CameraPreviewModelCopyWithImpl<$Res, _$_CameraPreviewModel>
    implements _$$_CameraPreviewModelCopyWith<$Res> {
  __$$_CameraPreviewModelCopyWithImpl(
      _$_CameraPreviewModel _value, $Res Function(_$_CameraPreviewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusPositionX = null,
    Object? focusPositionY = null,
    Object? exposure = null,
    Object? isCameraReady = null,
  }) {
    return _then(_$_CameraPreviewModel(
      focusPositionX: null == focusPositionX
          ? _value.focusPositionX
          : focusPositionX // ignore: cast_nullable_to_non_nullable
              as double,
      focusPositionY: null == focusPositionY
          ? _value.focusPositionY
          : focusPositionY // ignore: cast_nullable_to_non_nullable
              as double,
      exposure: null == exposure
          ? _value.exposure
          : exposure // ignore: cast_nullable_to_non_nullable
              as double,
      isCameraReady: null == isCameraReady
          ? _value.isCameraReady
          : isCameraReady // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CameraPreviewModel implements _CameraPreviewModel {
  _$_CameraPreviewModel(
      {this.focusPositionX = 0,
      this.focusPositionY = 0,
      this.exposure = 0,
      this.isCameraReady = false});

  @override
  @JsonKey()
  final double focusPositionX;
  @override
  @JsonKey()
  final double focusPositionY;
  @override
  @JsonKey()
  final double exposure;
  @override
  @JsonKey()
  final bool isCameraReady;

  @override
  String toString() {
    return 'CameraPreviewModel(focusPositionX: $focusPositionX, focusPositionY: $focusPositionY, exposure: $exposure, isCameraReady: $isCameraReady)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CameraPreviewModel &&
            (identical(other.focusPositionX, focusPositionX) ||
                other.focusPositionX == focusPositionX) &&
            (identical(other.focusPositionY, focusPositionY) ||
                other.focusPositionY == focusPositionY) &&
            (identical(other.exposure, exposure) ||
                other.exposure == exposure) &&
            (identical(other.isCameraReady, isCameraReady) ||
                other.isCameraReady == isCameraReady));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, focusPositionX, focusPositionY, exposure, isCameraReady);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CameraPreviewModelCopyWith<_$_CameraPreviewModel> get copyWith =>
      __$$_CameraPreviewModelCopyWithImpl<_$_CameraPreviewModel>(
          this, _$identity);
}

abstract class _CameraPreviewModel implements CameraPreviewModel {
  factory _CameraPreviewModel(
      {final double focusPositionX,
      final double focusPositionY,
      final double exposure,
      final bool isCameraReady}) = _$_CameraPreviewModel;

  @override
  double get focusPositionX;
  @override
  double get focusPositionY;
  @override
  double get exposure;
  @override
  bool get isCameraReady;
  @override
  @JsonKey(ignore: true)
  _$$_CameraPreviewModelCopyWith<_$_CameraPreviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
