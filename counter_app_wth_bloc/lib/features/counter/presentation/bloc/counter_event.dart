import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_event.freezed.dart';

@freezed
class CounterEvent with _$CounterEvent {
  const factory CounterEvent.increment() = Increment;
  const factory CounterEvent.decrement() = Decrement;
  const factory CounterEvent.reset() = Reset;
}