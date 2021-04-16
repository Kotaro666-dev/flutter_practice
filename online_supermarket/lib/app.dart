import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:online_supermarket/redux/app_state_reducer.dart';
import 'package:online_supermarket/views/payment/payment_page.dart';
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
    return StoreProvider<AppState>(
      store: _store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,

          /// タップ時のリップルエフェクト（splashColor）を発生させないようにする。
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith(
                (states) {
                  return states.contains(MaterialState.pressed)
                      ? Colors.transparent
                      : null;
                },
              ),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: MarketPage.withDependencies(
          store: _store,
          context: context,
        ),
        onGenerateRoute: (settings) {
          if (settings.name == ShoppingCartPage.routeName) {
            final argument = settings.arguments as ShoppingCartPageArgument;
            return MaterialPageRoute<ShoppingCartPage>(
              builder: (context) => ShoppingCartPage(store: argument.store),
            );
          } else if (settings.name == PaymentPage.routeName) {
            final argument = settings.arguments as PaymentPageArgument;
            return MaterialPageRoute<PaymentPage>(
              builder: (context) => PaymentPage(store: argument.store),
            );
          }
          return null;
        },
      ),
    );
  }
}
