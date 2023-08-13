// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CounterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
    required TResult Function() decrement,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? decrement,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? decrement,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Increment value) increment,
    required TResult Function(Decrement value) decrement,
    required TResult Function(Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(Decrement value)? decrement,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterEventCopyWith<$Res> {
  factory $CounterEventCopyWith(
          CounterEvent value, $Res Function(CounterEvent) then) =
      _$CounterEventCopyWithImpl<$Res, CounterEvent>;
}

/// @nodoc
class _$CounterEventCopyWithImpl<$Res, $Val extends CounterEvent>
    implements $CounterEventCopyWith<$Res> {
  _$CounterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IncrementCopyWith<$Res> {
  factory _$$IncrementCopyWith(
          _$Increment value, $Res Function(_$Increment) then) =
      __$$IncrementCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IncrementCopyWithImpl<$Res>
    extends _$CounterEventCopyWithImpl<$Res, _$Increment>
    implements _$$IncrementCopyWith<$Res> {
  __$$IncrementCopyWithImpl(
      _$Increment _value, $Res Function(_$Increment) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Increment implements Increment {
  const _$Increment();

  @override
  String toString() {
    return 'CounterEvent.increment()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Increment);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
    required TResult Function() decrement,
    required TResult Function() reset,
  }) {
    return increment();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? decrement,
    TResult? Function()? reset,
  }) {
    return increment?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? decrement,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (increment != null) {
      return increment();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Increment value) increment,
    required TResult Function(Decrement value) decrement,
    required TResult Function(Reset value) reset,
  }) {
    return increment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(Reset value)? reset,
  }) {
    return increment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(Decrement value)? decrement,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) {
    if (increment != null) {
      return increment(this);
    }
    return orElse();
  }
}

abstract class Increment implements CounterEvent {
  const factory Increment() = _$Increment;
}

/// @nodoc
abstract class _$$DecrementCopyWith<$Res> {
  factory _$$DecrementCopyWith(
          _$Decrement value, $Res Function(_$Decrement) then) =
      __$$DecrementCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DecrementCopyWithImpl<$Res>
    extends _$CounterEventCopyWithImpl<$Res, _$Decrement>
    implements _$$DecrementCopyWith<$Res> {
  __$$DecrementCopyWithImpl(
      _$Decrement _value, $Res Function(_$Decrement) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Decrement implements Decrement {
  const _$Decrement();

  @override
  String toString() {
    return 'CounterEvent.decrement()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Decrement);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
    required TResult Function() decrement,
    required TResult Function() reset,
  }) {
    return decrement();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? decrement,
    TResult? Function()? reset,
  }) {
    return decrement?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? decrement,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (decrement != null) {
      return decrement();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Increment value) increment,
    required TResult Function(Decrement value) decrement,
    required TResult Function(Reset value) reset,
  }) {
    return decrement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(Reset value)? reset,
  }) {
    return decrement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(Decrement value)? decrement,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) {
    if (decrement != null) {
      return decrement(this);
    }
    return orElse();
  }
}

abstract class Decrement implements CounterEvent {
  const factory Decrement() = _$Decrement;
}

/// @nodoc
abstract class _$$ResetCopyWith<$Res> {
  factory _$$ResetCopyWith(_$Reset value, $Res Function(_$Reset) then) =
      __$$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCopyWithImpl<$Res>
    extends _$CounterEventCopyWithImpl<$Res, _$Reset>
    implements _$$ResetCopyWith<$Res> {
  __$$ResetCopyWithImpl(_$Reset _value, $Res Function(_$Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Reset implements Reset {
  const _$Reset();

  @override
  String toString() {
    return 'CounterEvent.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
    required TResult Function() decrement,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? decrement,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? decrement,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Increment value) increment,
    required TResult Function(Decrement value) decrement,
    required TResult Function(Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(Decrement value)? decrement,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class Reset implements CounterEvent {
  const factory Reset() = _$Reset;
}
