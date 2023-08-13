import 'package:counter_app_wth_bloc/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:counter_app_wth_bloc/features/counter/presentation/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (_) => CounterBloc(), child: const CounterPage()),
    );
  }
}
