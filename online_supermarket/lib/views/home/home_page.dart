import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:online_supermarket/views/payment/payment_page.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market List'),
        actions: const [
          ShoppingCartIcon(),
        ],
      ),
      body: StoreConnector<AppState, List<Item>>(
        converter: (store) => store.state.itemList,
        builder: (context, List<Item> stateItemList) {
          return SafeArea(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: stateItemList.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Text(stateItemList[index].name),
                    Image(
                      width: 50,
                      image: AssetImage(
                        stateItemList[index].imagePath,
                      ),
                    ),
                    Text('${stateItemList[index].price} 円'),
                    // Text('${stateItemList[index].count} 個'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            child: const Icon(
                              Icons.remove,
                            ),
                            style: ElevatedButton.styleFrom(
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
                        ElevatedButton(
                          child: const Icon(Icons.add),
                          style: ElevatedButton.styleFrom(
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
                      ],
                    ),
                  ],
                );
              },
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
        Navigator.push<PaymentPage>(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentPage(store: model.store),
          ),
        );
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
            Positioned(
              right: 0,
              top: 5,
              child: SizedBox(
                height: 18,
                width: 18,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red,
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
