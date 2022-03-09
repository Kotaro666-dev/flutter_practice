import 'package:flutter/material.dart';

class NavigatorMiddleware<R extends Route<dynamic>> extends RouteObserver<R> {
  NavigatorMiddleware();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint(
        '【didPush】 \n currentPage: ${route.settings.name} \n previousPage: ${previousRoute?.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint(
        '【didPop】 \n previousPage: ${route.settings.name} \n currentPage: ${previousRoute?.settings.name}');
  }
}
