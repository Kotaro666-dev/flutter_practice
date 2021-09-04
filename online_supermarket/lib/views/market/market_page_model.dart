import 'package:flutter/material.dart';
import 'package:online_supermarket/constants/constant.dart';
import 'package:online_supermarket/models/item.dart';
import 'package:online_supermarket/views/shoppingCart/shopping_cart_page.dart';

import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/action.dart';
import 'package:online_supermarket/redux/state.dart';

class MarketPageModel extends ChangeNotifier {
  MarketPageModel({
    required Store<AppState> store,
  }) : _store = store;

  final Store<AppState> _store;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final PageController _pageController = PageController(initialPage: 0);
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

  Color _getSnackBarBackgroundColor(MyCategory category) {
    if (category == MyCategory.vegetables) {
      return kVegetableColor;
    } else if (category == MyCategory.meat) {
      return kMeatColor;
    } else if (category == MyCategory.fruits) {
      return kFruitsColor;
    } else {
      return Colors.lightGreen;
    }
  }

  void _displaySnackBar(Item item, BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: _getSnackBarBackgroundColor(item.category!),
      duration: const Duration(milliseconds: 1000),
      content: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              width: 30,
              image: AssetImage(
                item.imagePath,
              ),
            ),
            Row(
              children: [
                Text('小計（$totalItemCount 点)'),
                const SizedBox(width: 10),
                Text(
                  '${_store.state.totalPrice} 円',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            )
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
