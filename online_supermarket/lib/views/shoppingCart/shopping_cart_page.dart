import 'package:flutter/material.dart';
import 'package:online_supermarket/constants/constant.dart';
import 'package:online_supermarket/views/shoppingCart/shopping_cart_page_model.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/state.dart';

import '../../redux/state.dart';

class ShoppingCartPageArgument {
  const ShoppingCartPageArgument({required this.store});
  final Store<AppState> store;
}

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({
    Key? key,
    required this.store,
  }) : super(key: key);
  final Store<AppState> store;

  static const routeName = '/shopping_cart_page';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShoppingCartPageModel(
        store: store,
      ),
      child: Builder(
        builder: (BuildContext context) {
          final model = Provider.of<ShoppingCartPageModel>(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text('カート'),
              actions: const [
                EmptyCartTextButton(),
              ],
            ),
            body: SafeArea(
              child: Column(
                children: [
                  model.isCartEmpty
                      ? const CartEmptyMessage()
                      : const ItemListView(),
                  const StraightLineDivider(),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              CartItemCard(),
                              StraightLineDivider(),
                              CheckOutButton(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class EmptyCartTextButton extends StatelessWidget {
  const EmptyCartTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ShoppingCartPageModel>(context);
    return Visibility(
      visible: !model.isCartEmpty,
      child: TextButton(
        onPressed: () async {
          await model.onTapEmptyCart(context);
        },
        child: const Text(
          '空にする',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ShoppingCartPageModel>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'アイテム数： ${model.totalItemCount} 点',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '商品合計： ¥${model.totalPrice}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ShoppingCartPageModel>(context);
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.8,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (!model.isCartEmpty) {
            model.onTapProceedCheckOut(context);
          }
        },
        style: ElevatedButton.styleFrom(
          shape: kElevatedButtonBorderRadius,
          primary: !model.isCartEmpty ? Colors.redAccent : Colors.grey.shade500,
        ),
        child: const Text(
          '支払いへ進む',
          style: kElevatedButtonTextStyle,
        ),
      ),
    );
  }
}

class StraightLineDivider extends StatelessWidget {
  const StraightLineDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 5,
      thickness: 1,
    );
  }
}

class CartEmptyMessage extends StatelessWidget {
  const CartEmptyMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.65,
      child: const Center(
        child: Text(
          'カートの中身は空です',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class ItemListView extends StatelessWidget {
  const ItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ShoppingCartPageModel>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.65,
      child: ListView.builder(
        itemCount: model.itemList.length,
        itemBuilder: (BuildContext context, int index) {
          if (model.itemList[index].count == 0) {
            return const SizedBox();
          }
          return SizedBox(
            width: width * 0.8,
            height: height * 0.1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        width: 50,
                        image: AssetImage(
                          model.itemList[index].imagePath,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.itemList[index].name),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '¥ ${model.itemList[index].price}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            model.onTapDecrementIcon(index);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: kElevatedButtonBorderRadius,
                            primary: Colors.redAccent,
                          ),
                          child: const Icon(Icons.remove),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 20,
                        child: Center(
                          child: Text(
                            '${model.itemList[index].count}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            model.onTapIncrementIcon(index);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: kElevatedButtonBorderRadius,
                          ),
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
