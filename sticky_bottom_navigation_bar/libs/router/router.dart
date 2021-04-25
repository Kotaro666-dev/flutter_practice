import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/tab_bar_pages/home_page.dart';
import '../pages/tab_bar_pages/payment_page.dart';
import '../pages/tab_bar_pages/settings_page.dart';
import '../pages/tab_bar_pages/shopping_page.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case ShoppingPage.routeName:
        return MaterialPageRoute(
          builder: (_) => ShoppingPage(),
        );
      case PaymentPage.routeName:
        return MaterialPageRoute(
          builder: (_) => PaymentPage(),
        );
      case SettingsPage.routeName:
        return MaterialPageRoute(
          builder: (_) => SettingsPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
    }
  }
}

final appRoutes = {
  HomePage.routeName: (_) => HomePage(),
  ShoppingPage.routeName: (_) => ShoppingPage(),
  PaymentPage.routeName: (_) => PaymentPage(),
  SettingsPage.routeName: (_) => SettingsPage(),
};
