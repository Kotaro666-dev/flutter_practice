import 'package:flutter/material.dart';
import 'package:online_supermarket/redux/state.dart';
import 'package:redux/redux.dart';

class HomePageModel extends ChangeNotifier {
  HomePageModel({this.store}) {}

  final Store<AppState> store;

  int _currentIndex;
  int get currentIndex => _currentIndex;

  void onTapBottomTabBar(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
