import 'package:flutter/material.dart';
import 'package:online_supermarket/models/item.dart';
import 'package:online_supermarket/redux/action.dart';
import 'package:online_supermarket/views/payment/payment_page.dart';

import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/state.dart';

class ShoppingCartPageModel extends ChangeNotifier {
  ShoppingCartPageModel({
    required Store<AppState> store,
  }) : _store = store {
    _initialize();
  }

  final Store<AppState> _store;

  late List<Item> _itemList;
  List<Item> get itemList => _itemList;

  bool _isCartEmpty = false;
  bool get isCartEmpty => _isCartEmpty;

  int get totalPrice => _store.state.totalPrice;

  int get totalItemCount => _store.state.totalItemCount;

  void _initialize() {
    _itemList = _store.state.itemList;
    if (_store.state.totalItemCount == 0) {
      _isCartEmpty = true;
    }
  }

  void onTapIncrementIcon(int index) {
    final item = _store.state.itemList[index];
    _store
      ..dispatch(IncrementItemAction(updateItem: item))
      ..dispatch(IncrementTotalItemCountAction(
          totalItemCount: _store.state.totalItemCount))
      ..dispatch(UpdateTotalPriceAction(
          totalPrice: _store.state.totalPrice + item.price));
    notifyListeners();
  }

  void onTapDecrementIcon(int index) {
    final item = _store.state.itemList[index];
    _store
      ..dispatch(DecrementItemAction(updateItem: item))
      ..dispatch(DecrementTotalItemCountAction(
          totalItemCount: _store.state.totalItemCount))
      ..dispatch(UpdateTotalPriceAction(
          totalPrice: _store.state.totalPrice - item.price));
    if (_store.state.totalItemCount == 0) {
      _isCartEmpty = true;
    }
    notifyListeners();
  }

  void onTapProceedCheckOut(BuildContext context) {
    Navigator.pushNamed(
      context,
      PaymentPage.routeName,
      arguments: PaymentPageArgument(store: _store),
    );
  }

  Future<void> onTapEmptyCart(BuildContext context) async {
    await showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'カートを空にしますか？',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'この操作は取り消せません',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        actions: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'キャンセル',
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              _store
                ..dispatch(EmptyCartAction(itemList: _store.state.itemList))
                ..dispatch(ResetTotalItemCountAction())
                ..dispatch(ResetTotalPriceAction());
              if (_store.state.totalItemCount == 0) {
                _isCartEmpty = true;
              }
              notifyListeners();
              Navigator.pop(context);
            },
            child: const Text(
              '空にする',
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
