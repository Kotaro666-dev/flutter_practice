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

  void _initialize() {}

  int get totalItemCount => _store.state.totalItemCount;

  Store<AppState> get store => _store;

  void onTapIncrementIcon(int index, BuildContext context) {
    final item = _store.state.itemList[index];
    _store
      ..dispatch(IncrementItemAction(updateItem: item))
      ..dispatch(IncrementTotalItemCountAction(
          totalItemCount: _store.state.totalItemCount))
      ..dispatch(UpdateTotalPriceAction(
          totalPrice: _store.state.totalPrice + item.price));
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
              '${_store.state.totalPrice} 円',
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
    final item = _store.state.itemList[index];
    _store
      ..dispatch(DecrementItemAction(updateItem: item))
      ..dispatch(DecrementTotalItemCountAction(
          totalItemCount: _store.state.totalItemCount))
      ..dispatch(UpdateTotalPriceAction(
          totalPrice: _store.state.totalPrice - item.price));
    notifyListeners();
    if (_store.state.totalItemCount == 0) {
      return;
    }
    notifyListeners();
  }

  void onTapShoppingCartIcon(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    Navigator.pushNamed(
      context,
      PaymentPage.routeName,
      arguments: _store,
    ).then((value) {
      /// PaymentPage から戻ってきたときに、追加/削除したアイテム個数や合計金額をアップデートするため
      notifyListeners();
    });
  }
}
