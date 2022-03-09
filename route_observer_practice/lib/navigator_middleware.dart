import 'package:flutter/material.dart';

// 参考資料：https://medium.com/@payam_zahedi/flutter-navigator-middleware-part-2-middleware-service-class-c9035f4fff68
class NavigatorMiddleware<R extends Route<dynamic>> extends RouteObserver<R> {
  NavigatorMiddleware() : _routeStack = [];

  final List<Route<dynamic>> _routeStack;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _routeStack.add(route);
    debugPrint(
        'イベント名：didPush\n今ページ: ${route.settings.name}\n前ページ: ${previousRoute?.settings.name}');
    _printRouteStack();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _routeStack.removeLast();
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
