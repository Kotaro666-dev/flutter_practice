import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/state.dart';

class PaymentPageModel extends ChangeNotifier {
  PaymentPageModel({
    @required Store<AppState> store,
  }) : _store = store {
    _initialize();
  }

  final Store<AppState> _store;

  int _sum;
  int get sum => _sum;

  void _initialize() {
    _calculateSum();
  }

  void _calculateSum() {
    _sum = 0;
    for (final item in _store.state.itemList) {
      _sum += item.count * item.price;
    }
    notifyListeners();
  }
}
