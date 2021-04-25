import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'payment_page.dart';
import 'settings_page.dart';
import 'shopping_page.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case ShoppingPage.routeName:
        return MaterialPageRoute(
          builder: (context) => ShoppingPage(),
        );
      case PaymentPage.routeName:
        return MaterialPageRoute(
          builder: (context) => PaymentPage(),
        );
      case SettingsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => SettingsPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
    }
  }
}
