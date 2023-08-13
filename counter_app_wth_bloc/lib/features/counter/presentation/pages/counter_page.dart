import 'package:counter_app_wth_bloc/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:counter_app_wth_bloc/features/counter/presentation/bloc/counter_state.dart';
import 'package:counter_app_wth_bloc/features/counter/presentation/widgets/multiple_floating_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Counter App With BLoC pattern"),
        ),
        body: const _Body(),
        floatingActionButton: const MultipleFloatingActionButtons());
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) => Text(
              "${state.value}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
