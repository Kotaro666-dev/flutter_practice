import 'package:flutter/material.dart';
import 'package:route_observer_practice/views/first_page.dart';
import 'package:route_observer_practice/views/home_page.dart';
import 'package:route_observer_practice/views/second_page.dart';
import 'package:route_observer_practice/views/third_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        FirstPage.routeName: (context) => const FirstPage(),
        SecondPage.routeName: (context) => const SecondPage(),
        ThirdPage.routeName: (context) => const ThirdPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
