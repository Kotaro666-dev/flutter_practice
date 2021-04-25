import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../router/router.dart';
import '../tab_bar_pages/home_page.dart';
import '../tab_bar_pages/payment_page.dart';
import '../tab_bar_pages/settings_page.dart';
import '../tab_bar_pages/shopping_page.dart';

class TabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'shopping',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              routes: appRoutes,
              builder: (context) {
                return CupertinoPageScaffold(child: HomePage());
              },
            );
          case 1:
            return CupertinoTabView(
              routes: appRoutes,
              builder: (context) {
                return CupertinoPageScaffold(child: ShoppingPage());
              },
            );
          case 2:
            return CupertinoTabView(
              routes: appRoutes,
              builder: (context) {
                return CupertinoPageScaffold(child: PaymentPage());
              },
            );
          case 3:
            return CupertinoTabView(
              routes: appRoutes,
              builder: (context) {
                return CupertinoPageScaffold(child: SettingsPage());
              },
            );
          default:
            return CupertinoTabView(
              routes: appRoutes,
              builder: (context) {
                return CupertinoPageScaffold(child: HomePage());
              },
            );
        }
      },
    );
  }
}
