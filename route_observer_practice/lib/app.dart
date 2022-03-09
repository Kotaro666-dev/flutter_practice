import 'package:flutter/material.dart';
import 'package:route_observer_practice/custom_routes.dart';
import 'package:route_observer_practice/navigator_middleware.dart';
import 'package:route_observer_practice/views/home_page.dart';

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: HomePage.routeName,
      routes: customRoutes,
      navigatorObservers: [routeObserver, navigatorMiddleware],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
