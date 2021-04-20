import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/view/category_page/category_page.dart';
import 'package:to_do_list_with_riverpod/view/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Practice With RiverPod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: HomePage(),
      home: CategoryPage(),
      onGenerateRoute: (settings) {
        if (settings.name == HomePage.routeName) {
          final argument = settings.arguments as HomePageArgument;
          return MaterialPageRoute<HomePage>(
            builder: (context) => HomePage(deadlineType: argument.deadlineType),
          );
        }
        return null;
      },
    );
  }
}
