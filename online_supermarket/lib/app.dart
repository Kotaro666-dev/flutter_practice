import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:online_supermarket/redux/app_state_reducer.dart';
import 'package:online_supermarket/views/shoppingCart/shopping_cart_page.dart';
import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/state.dart';
import 'package:online_supermarket/views/market/market_page.dart';

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
        child: MarketPage.withDependencies(
          store: _store,
          context: context,
        ),
      ),
      onGenerateRoute: (settings) {
        if (settings.name == ShoppingCartPage.routeName) {
          return MaterialPageRoute<ShoppingCartPage>(
            builder: (context) => ShoppingCartPage(store: _store),
          );
        }
        return null;
      },
    );
  }
}
