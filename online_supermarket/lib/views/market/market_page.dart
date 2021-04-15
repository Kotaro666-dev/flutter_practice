import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:online_supermarket/models/item.dart';
import 'package:online_supermarket/redux/state.dart';

import 'market_page_model.dart';

class MarketPage extends StatelessWidget {
  const MarketPage._({Key key}) : super(key: key);

  static Widget withDependencies({
    @required Store<AppState> store,
    @required BuildContext context,
    Key key,
  }) =>
      ChangeNotifierProvider(
        key: key,
        create: (_context) => MarketPageModel(
          store: store,
        ),
        child: const MarketPage._(),
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('市場'),
          actions: const [
            ShoppingCartIcon(),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              TabItem(title: '野菜'),
              TabItem(title: '肉'),
              TabItem(title: '果物'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ItemPageView(category: MyCategory.vegetables),
            ItemPageView(category: MyCategory.meat),
            ItemPageView(category: MyCategory.fruits),
          ],
        ),
        // body: ItemPageView(),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        '$title',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}

class ItemPageView extends StatelessWidget {
  const ItemPageView({this.category});
  final MyCategory category;
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MarketPageModel>(context);
    final width = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, List<Item>>(
      converter: (store) => store.state.itemList,
      builder: (context, List<Item> stateItemList) {
        final itemList =
            stateItemList.where((item) => item.category == category).toList();
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
              ),
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.5, 0.5),
                        blurRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(
                          width: width * 0.2,
                          image: AssetImage(
                            itemList[index].imagePath,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(itemList[index].name),
                                Text(
                                  '¥ ${itemList[index].price}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            if (model.store.state.itemList[index].count != 0)
                              Text(
                                // ignore: lines_longer_than_80_chars
                                '${model.store.state.itemList[index].count} 個',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: ElevatedButton(
                                  child: const Icon(
                                    Icons.remove,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    primary: itemList[index].count != 0
                                        ? Colors.redAccent
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    if (itemList[index].count == 0) {
                                      return;
                                    }
                                    model.onTapDecrementIcon(index);
                                  }),
                            ),
                            const SizedBox(
                              width: 20,
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
                                  model.onTapIncrementIcon(
                                      itemList[index], context);
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
          ),
        );
      },
    );
  }
}

class ShoppingCartIcon extends StatelessWidget {
  const ShoppingCartIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MarketPageModel>(context);
    return GestureDetector(
      onTap: () {
        model.onTapShoppingCartIcon(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          right: 10,
        ),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
            ),
            if (model.totalItemCount != 0)
              Positioned(
                right: 0,
                top: 5,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('${model.totalItemCount}'),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
