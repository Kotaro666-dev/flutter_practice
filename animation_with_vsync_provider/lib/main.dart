import 'package:animation_with_vsync_provider/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsync_provider/vsync_provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        const VsyncProvider(),
      ],
      child: MaterialApp(
        title: 'Animation with VsyncProvider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
