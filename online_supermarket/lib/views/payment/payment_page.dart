import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:online_supermarket/models/card.dart';
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
            body: StoreConnector<AppState, List<PaymentCard>>(
              converter: (store) => store.state.cardList,
              builder: (context, List<PaymentCard> stateCardList) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
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
                        const StraightLineDivider(),
                        const Expanded(
                          child: Center(
                            child: Text(
                              '支払い方法を選択',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: ListView.builder(
                            itemCount: stateCardList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final card = stateCardList[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Center(
                                  child: SizedBox(
                                    width: width * 0.8,
                                    height: 70,
                                    child: GestureDetector(
                                      onTap: () {
                                        model.onTapCard(index);
                                      },
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                              ),
                                              child: SizedBox(
                                                width: 15,
                                                height: 15,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                      width: 2,
                                                      color: card.isSelected
                                                          ? Colors.green
                                                          : Colors
                                                              .grey.shade300,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20,
                                              ),
                                              child: Image(
                                                width: 40,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    model.getCardNumber(
                                                        card.number),
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    // ignore: lines_longer_than_80_chars
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
                              primary: model.canProceedCheckOut()
                                  ? Colors.redAccent
                                  : Colors.grey,
                            ),
                            onPressed: () async {
                              if (model.canProceedCheckOut()) {
                                await model.onTapProceedCheckOut(context);
                              }
                            },
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
                );
              },
            ),
          );
        },
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
      indent: 10,
      endIndent: 10,
    );
  }
}
