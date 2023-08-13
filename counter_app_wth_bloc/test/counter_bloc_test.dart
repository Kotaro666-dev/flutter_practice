import 'package:counter_app_wth_bloc/features/counter/presentation/bloc/counter_event.dart';
import 'package:counter_app_wth_bloc/features/counter/presentation/bloc/counter_state.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app_wth_bloc/features/counter/presentation/bloc/counter_bloc.dart';

void main() {
  late CounterBloc counterBloc;

  setUp(() {
    counterBloc = CounterBloc();
  });

  tearDown(() {
    counterBloc.close();
  });

  test("Initial value should be 0", () {
    expect(counterBloc.state.value, 0);
  });

  blocTest(
    "Value should be incremented",
    build: () => counterBloc,
    act: (bloc) => bloc.add(const CounterEvent.increment()),
    expect: () => [const CounterState(value: 1)],
  );

  blocTest(
    "Value should be decremented",
    build: () => counterBloc,
    seed: () => const CounterState(value: 10),
    act: (bloc) => bloc.add(const CounterEvent.decrement()),
    expect: () => [const CounterState(value: 9)],
  );

  blocTest(
    "Value should be 0",
    build: () => counterBloc,
    seed: () => const CounterState(value: 10),
    act: (bloc) => bloc.add(const CounterEvent.reset()),
    expect: () => [const CounterState(value: 0)],
  );
}
