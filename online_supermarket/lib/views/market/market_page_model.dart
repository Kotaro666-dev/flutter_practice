import 'package:flutter/material.dart';
import 'package:online_supermarket/models/item.dart';
import 'package:online_supermarket/views/shoppingCart/shopping_cart_page.dart';

import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/action.dart';
import 'package:online_supermarket/redux/state.dart';

class MarketPageModel extends ChangeNotifier {
  MarketPageModel({
    @required Store<AppState> store,
  }) : _store = store {
    _initialize();
  }

  final Store<AppState> _store;

  void _initialize() {
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  PageController _pageController;
  PageController get pageController => _pageController;

  int get totalItemCount => _store.state.totalItemCount;

  Store<AppState> get store => _store;

  void onTapIncrementIcon(Item item, BuildContext context) {
    _store
      ..dispatch(IncrementItemAction(updateItem: item))
      ..dispatch(IncrementTotalItemCountAction(
          totalItemCount: _store.state.totalItemCount))
      ..dispatch(UpdateTotalPriceAction(
          totalPrice: _store.state.totalPrice + item.price));
    _displaySnackBar(item, context);
    notifyListeners();
  }

  void onTapDecrementIcon(Item item) {
    _store
      ..dispatch(DecrementItemAction(updateItem: item))
      ..dispatch(DecrementTotalItemCountAction(
          totalItemCount: _store.state.totalItemCount))
      ..dispatch(UpdateTotalPriceAction(
          totalPrice: _store.state.totalPrice - item.price));
    notifyListeners();
  }

  void _displaySnackBar(Item item, BuildContext context) {
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
                item.imagePath,
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

  void onTapShoppingCartIcon(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    Navigator.pushNamed(
      context,
      ShoppingCartPage.routeName,
      arguments: ShoppingCartPageArgument(store: _store),
    ).then((value) {
      /// PaymentPage から戻ってきたときに、追加/削除したアイテム個数や合計金額をアップデートするため
      notifyListeners();
    });
  }
}
