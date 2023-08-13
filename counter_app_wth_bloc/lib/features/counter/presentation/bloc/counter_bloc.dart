import 'package:counter_app_wth_bloc/features/counter/presentation/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

const int initialValue = 0;

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(value: initialValue)) {
    on<CounterEvent>((events, emit) => events.map(
        increment: (_) => _increment(),
        decrement: (_) => _decrement(),
        reset: (_) => _reset()));
  }

  void _increment() {
    emit(state.copyWith(value: state.value + 1));
  }

  void _decrement() {
    if (state.value == initialValue) {
      return;
    }
    emit(state.copyWith(value: state.value - 1));
  }

  void _reset() {
    emit(state.copyWith(value: initialValue));
  }
}
