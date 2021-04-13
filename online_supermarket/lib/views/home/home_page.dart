import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:online_supermarket/models/item.dart';
import 'package:online_supermarket/redux/state.dart';

import 'home_page_model.dart';

class HomePage extends StatelessWidget {
  const HomePage._({Key key}) : super(key: key);

  static Widget withDependencies({
    @required Store<AppState> store,
    @required BuildContext context,
    Key key,
  }) =>
      ChangeNotifierProvider(
        key: key,
        create: (_context) => HomePageModel(
          store: store,
        ),
        child: const HomePage._(),
      );

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomePageModel>(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market'),
        actions: const [
          ShoppingCartIcon(),
        ],
      ),
      body: StoreConnector<AppState, List<Item>>(
        converter: (store) => store.state.itemList,
        builder: (context, List<Item> stateItemList) {
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
                itemCount: stateItemList.length,
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
                              stateItemList[index].imagePath,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(stateItemList[index].name),
                                  Text(
                                    '¥ ${stateItemList[index].price}',
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
                                      primary: stateItemList[index].count != 0
                                          ? Colors.redAccent
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      if (stateItemList[index].count == 0) {
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
                                    model.onTapIncrementIcon(index, context);
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
      ),
    );
  }
}

class ShoppingCartIcon extends StatelessWidget {
  const ShoppingCartIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomePageModel>(context);
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
