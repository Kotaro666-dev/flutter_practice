import 'package:flutter/material.dart';
import 'package:route_observer_practice/views/third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  static const routeName = 'second_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
