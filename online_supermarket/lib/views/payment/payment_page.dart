import 'package:flutter/material.dart';
import 'package:online_supermarket/views/payment/payment_page_model.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/state.dart';

import '../../redux/state.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({this.store});

  final Store<AppState> store;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaymentPageModel(
        store: store,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
        ),
        body: SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              final model = Provider.of<PaymentPageModel>(context);
              final width = MediaQuery.of(context).size.width;
              if (model.isCartEmpty) {
                return const Center(
                  child: Text('Cart is Empty'),
                );
              }
              return Column(
                children: [
                  ItemListView(),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        Row(
                                          children: [
                                            const Text(
                                              'アイテム数： ',
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '${model.totalItemCount} ',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Text(
                                              '点',
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              '商品合計： ',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 70,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '${model.totalPrice}',
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Text(
                                              '円',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: width * 0.8,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('CHECK OUT'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ItemListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PaymentPageModel>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.7,
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
