import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/action.dart';
import 'package:online_supermarket/redux/state.dart';

class HomePageModel extends ChangeNotifier {
  HomePageModel({
    @required Store<AppState> store,
  }) : _store = store {
    _initialize();
  }

  final Store<AppState> _store;

  void _initialize() {
    _totalItemCount = 0;
    _totalPrice = 0;
  }

  int _totalItemCount;
  int get totalItemCount => _totalItemCount;

  int _totalPrice;
  int get totalPrice => _totalPrice;

  Store<AppState> get store => _store;

  bool isVisible() {
    for (final item in _store.state.itemList) {
      if (item.count != 0) {
        return true;
      }
    }
    return false;
  }

  int calculateSum() {
    var sum = 0;
    for (final item in _store.state.itemList) {
      sum += item.price * item.count;
    }
    return sum;
  }

  void onTapIncrementIcon(int index, BuildContext context) {
    _totalPrice += _store.state.itemList[index].price;
    _totalItemCount++;
    _displaySnackBar(index, context);
    _store.dispatch(
        IncrementItemAction(updateItem: _store.state.itemList[index]));
    notifyListeners();
  }

  void _displaySnackBar(int index, BuildContext context) {
    final snackBar = SnackBar(
        backgroundColor: Colors.lime,
        duration: const Duration(milliseconds: 1500),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              width: 50,
              image: AssetImage(
                _store.state.itemList[index].imagePath,
              ),
            ),
            Text('${_store.state.itemList[index].price} 円'),
            Text('$totalPrice 円'),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void onTapDecrementIcon(int index) {
    _store.dispatch(
        DecrementItemAction(updateItem: _store.state.itemList[index]));
    if (_totalItemCount == 0) {
      return;
    }
    _totalPrice -= _store.state.itemList[index].price;
    _totalItemCount--;
    notifyListeners();
  }
}
