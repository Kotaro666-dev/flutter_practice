import 'package:flutter/material.dart';
import 'package:route_observer_practice/views/second_page.dart';
import 'package:route_observer_practice/views/third_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  static const routeName = 'first_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Second Page"),
              onPressed: () =>
                  Navigator.pushNamed(context, SecondPage.routeName),
            ),
            ElevatedButton(
              child: const Text("Third Page"),
              onPressed: () =>
                  Navigator.pushNamed(context, ThirdPage.routeName),
            )
          ],
        ),
      ),
    );
  }
}
