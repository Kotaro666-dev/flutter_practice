import 'package:flutter/material.dart';
import 'package:online_supermarket/views/payment/payment_page.dart';

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
    _calculateTotalPrice();
  }

  int _totalPrice;
  int get totalPrice => _totalPrice;

  int get totalItemCount => _store.state.totalSelectedItemCount;

  Store<AppState> get store => _store;

  void _calculateTotalPrice() {
    _totalPrice = 0;
    for (final item in _store.state.itemList) {
      _totalPrice += item.count * item.price;
    }
    notifyListeners();
  }

  void onTapIncrementIcon(int index, BuildContext context) {
    _store
      ..dispatch(IncrementItemAction(updateItem: _store.state.itemList[index]))
      ..dispatch(IncrementTotalSelectedItemCountAction(
          totalItemSelectedCount: _store.state.totalSelectedItemCount));
    _calculateTotalPrice();
    _displaySnackBar(index, context);
    notifyListeners();
  }

  void _displaySnackBar(int index, BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: Colors.lightGreen,
      duration: const Duration(milliseconds: 1000),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              width: 30,
              image: AssetImage(
                _store.state.itemList[index].imagePath,
              ),
            ),
            Text('小計（$totalItemCount 点)'),
            Text(
              '$_totalPrice 円',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void onTapDecrementIcon(int index) {
    _calculateTotalPrice();
    _store
      ..dispatch(DecrementItemAction(updateItem: _store.state.itemList[index]))
      ..dispatch(DecrementTotalSelectedItemCountAction(
          totalItemSelectedCount: _store.state.totalSelectedItemCount));
    notifyListeners();
    if (_store.state.totalSelectedItemCount == 0) {
      return;
    }
    notifyListeners();
  }

  void onTapShoppingCartIcon(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    Navigator.push<PaymentPage>(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPage(store: _store),
      ),
    ).then((value) {
      /// PaymentPage から戻ってきたときに、追加/削除したアイテム個数や合計金額をアップデートするため
      notifyListeners();
    });
  }
}
