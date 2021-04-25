import 'package:flutter/material.dart';

import 'router/router.dart';
import 'pages/initial_page/initial_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabBarPage(),
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}
