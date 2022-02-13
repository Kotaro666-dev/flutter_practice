import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_playground/provider/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final notifier = ref.read(counterProvider.notifier);

    ref.listen<int>(counterProvider, (int? previousCount, int newCount) {
      if (newCount == 10) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You reached to 10.')),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () {
                  notifier.reset();
                },
                child: const Text("Reset"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          notifier.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
