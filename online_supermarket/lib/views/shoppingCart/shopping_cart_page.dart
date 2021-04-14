import 'package:flutter/material.dart';
import 'package:online_supermarket/views/shoppingCart/shopping_cart_page_model.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/state.dart';

import '../../redux/state.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({this.store});
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
              actions: [
                Visibility(
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
                ),
              ],
            ),
            body: SafeArea(
              child: Column(
                children: [
                  model.isCartEmpty ? CartEmptyMessage() : ItemListView(),
                  const StraightLineDivider(),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                              ),
                              const StraightLineDivider(),
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

class CheckOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ShoppingCartPageModel>(context);
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.8,
      height: 50,
      child: ElevatedButton(
        onPressed:
            model.canProceedCheckOut() ? model.onTapProceedCheckOut : () {},
        child: const Text(
          'お支払いへ進む',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          primary: model.canProceedCheckOut()
              ? Colors.redAccent
              : Colors.grey.shade500,
        ),
      ),
    );
  }
}

class StraightLineDivider extends StatelessWidget {
  const StraightLineDivider({
    Key key,
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
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.65,
      child: const Center(
        child: Text('カートに商品はありません'),
      ),
    );
  }
}

class ItemListView extends StatelessWidget {
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
                          child: const Icon(Icons.remove),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            primary: Colors.redAccent,
                          ),
                          onPressed: () {
                            model.onTapDecrementIcon(index);
                          },
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
                          child: const Icon(Icons.add),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          onPressed: () {
                            model.onTapIncrementIcon(index);
                          },
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
