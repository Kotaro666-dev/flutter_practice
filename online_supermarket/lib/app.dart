import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:online_supermarket/redux/app_state_reducer.dart';
import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/state.dart';
import 'package:online_supermarket/views/home/home_page.dart';

class MyApp extends StatelessWidget {
  final Store<AppState> _store = Store<AppState>(
    appReducer,
    initialState: AppState.initialize(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: StoreProvider(
        store: _store,
        child: HomePage.withDependencies(
          store: _store,
          context: context,
        ),
      ),
    );
  }
}
