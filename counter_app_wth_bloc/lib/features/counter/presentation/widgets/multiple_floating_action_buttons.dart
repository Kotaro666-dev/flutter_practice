import 'package:counter_app_wth_bloc/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:counter_app_wth_bloc/features/counter/presentation/bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultipleFloatingActionButtons extends StatelessWidget {
  const MultipleFloatingActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () => counterBloc.add(const CounterEvent.increment()),
          tooltip: 'Increment',
          child: const Icon(
            Icons.add,
          ),
        ),
        const SizedBox(height: 20.0),
        FloatingActionButton(
          onPressed: () => counterBloc.add(const CounterEvent.decrement()),
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
        const SizedBox(height: 20.0),
        FloatingActionButton(
          onPressed: () => counterBloc.add(const CounterEvent.reset()),
          tooltip: 'Reset',
          child: const Text(
            "0",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );
  }
}
