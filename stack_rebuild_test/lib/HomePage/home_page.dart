import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stack_rebuild_test/HomePage/home_page_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageNotifier(),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack rebuild test'),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<HomePageNotifier>(context);
    return SafeArea(
        child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 300,
            height: 300,
            child: ColoredBox(
              color: notifier.firstColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 200,
            height: 200,
            child: ColoredBox(
              color: notifier.secondColor,
            ),
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            height: 100,
            child: ColoredBox(
              color: Colors.redAccent,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: notifier.onTapResetButton,
            child: const Text('Reset'),
          ),
        )
      ],
    ));
  }
}
