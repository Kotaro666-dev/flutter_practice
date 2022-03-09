import 'package:route_observer_practice/views/first_page.dart';
import 'package:route_observer_practice/views/home_page.dart';
import 'package:route_observer_practice/views/second_page.dart';
import 'package:route_observer_practice/views/third_page.dart';

final customRoutes = {
  HomePage.routeName: (context) => const HomePage(),
  FirstPage.routeName: (context) => const FirstPage(),
  SecondPage.routeName: (context) => const SecondPage(),
  ThirdPage.routeName: (context) => const ThirdPage(),
};
