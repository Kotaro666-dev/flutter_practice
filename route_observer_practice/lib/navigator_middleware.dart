import 'package:flutter/material.dart';
import 'package:route_observer_practice/views/first_page.dart';
import 'package:route_observer_practice/views/home_page.dart';
import 'package:route_observer_practice/views/second_page.dart';
import 'package:route_observer_practice/views/third_page.dart';

// 参考資料：https://medium.com/@payam_zahedi/flutter-navigator-middleware-part-2-middleware-service-class-c9035f4fff68

NavigatorMiddleware<PageRoute> navigatorMiddleware =
    NavigatorMiddleware<PageRoute>(
  onDidPushCallback: (route, previousRoute) {
    if (route.settings.name == FirstPage.routeName ||
        route.settings.name == SecondPage.routeName ||
        route.settings.name == ThirdPage.routeName) {
      debugPrint('WakeLock is enabled');
    }
  },
  onDidPopCallback: (route, previousRoute) {
    if (previousRoute?.settings.name == HomePage.routeName) {
      debugPrint('WakeLock is disabled');
    }
  },
);

typedef OnRouteChange<R extends Route<dynamic>> = void Function(
    Route<dynamic> route, Route<dynamic>? previousRoute);

class NavigatorMiddleware<R extends Route<dynamic>> extends RouteObserver<R> {
  NavigatorMiddleware({
    required this.onDidPushCallback,
    required this.onDidPopCallback,
  }) : _routeStack = [];

  final List<Route<dynamic>> _routeStack;

  final OnRouteChange<R> onDidPushCallback;
  final OnRouteChange<R> onDidPopCallback;

  get currentPageName => _routeStack.last.settings.name;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _routeStack.add(route);
    onDidPushCallback(route, previousRoute);
    debugPrint(
        'イベント名：didPush\n今ページ: ${route.settings.name}\n前ページ: ${previousRoute?.settings.name}');
    _printRouteStack();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _routeStack.removeLast();
    onDidPopCallback(route, previousRoute);
    debugPrint(
        'イベント名：didPop\n前ページ: ${route.settings.name}\n今ページ: ${previousRoute?.settings.name}');
    _printRouteStack();
  }

  void _printRouteStack() {
    final copyStack = List.from(_routeStack);
    debugPrint("############ HEAD #############");
    while (copyStack.isNotEmpty) {
      debugPrint(copyStack.last.settings.name);
      copyStack.removeLast();
    }
    debugPrint("############ TAIL #############\n");
  }
}
