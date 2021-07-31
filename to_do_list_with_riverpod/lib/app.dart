import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/view/home_page/home_page.dart';
import 'package:to_do_list_with_riverpod/view/task_list_page/task_list_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Practice With RiverPod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: HomePage(),
      home: HomePage(),
      onGenerateRoute: (settings) {
        if (settings.name == TaskListPage.routeName) {
          final argument = settings.arguments as TaskListPageArgument;
          return MaterialPageRoute<TaskListPage>(
            builder: (context) =>
                TaskListPage(deadlineType: argument.deadlineType),
          );
        }
        return null;
      },
    );
  }
}
