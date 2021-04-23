import 'package:flutter/cupertino.dart';
import 'package:online_supermarket/redux/state.dart';
import 'package:redux/redux.dart';

class BottomTabBarModel extends ChangeNotifier {
  BottomTabBarModel({
    @required Store<AppState> store,
  }) : _store = store {
    _initialize();
  }

  final Store<AppState> _store;

  int _currentIndex;
  int get currentIndex => _currentIndex;

  void _initialize() {
    _currentIndex = 0;
  }

  void onTapBottomTabBar(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
