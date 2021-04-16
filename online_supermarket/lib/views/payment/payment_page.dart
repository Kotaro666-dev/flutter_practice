import 'package:flutter/material.dart';
import 'package:online_supermarket/models/payment_card_data_base.dart';
import 'package:online_supermarket/views/payment/payment_page_model.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/state.dart';

import '../../redux/state.dart';

class PaymentPageArgument {
  const PaymentPageArgument({
    this.store,
  });
  final Store<AppState> store;
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({
    this.store,
  });
  final Store<AppState> store;

  static const routeName = '/payment_page';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaymentPageModel(
        store: store,
      ),
      child: Builder(
        builder: (BuildContext context) {
          final model = Provider.of<PaymentPageModel>(context);
          final width = MediaQuery.of(context).size.width;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text('お支払い'),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'お支払い金額：${store.state.totalPrice} 円',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          '支払い方法を選択',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: ListView.builder(
                          itemCount: cardListDB.length,
                          itemBuilder: (BuildContext context, int index) {
                            final card = cardListDB[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Center(
                                child: SizedBox(
                                  width: width * 0.8,
                                  height: 70,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    width: 3,
                                                    color: Colors.green,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: Image(
                                              width: 30,
                                              image: AssetImage(
                                                model.getCardImagePath(
                                                    card.cardType),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  model.getCardNumber(
                                                      card.number),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  '有効期限：${card.expirationDate}',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: width * 0.8,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                          ),
                          onPressed: () {},
                          child: const Text(
                            '支払う',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
