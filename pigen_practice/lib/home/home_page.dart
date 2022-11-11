import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pigen_practice/home/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pigeon Practice'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(homeProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('${home.id}'),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(homeProvider.notifier)
                      .onPressedProceedMethodChannel();
                },
                child: const Text('Proceed MethodChannel'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(homeProvider.notifier).onPressedReset();
                },
                child: const Text('Reset'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
