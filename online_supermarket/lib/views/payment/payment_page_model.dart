import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_supermarket/models/card.dart';
import 'package:online_supermarket/progress_indicator.dart';
import 'package:online_supermarket/redux/action.dart';

import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/state.dart';

const visaImagePath = 'assets/images/card/visa.png';
const masterCardImagePath = 'assets/images/card/mastercard.png';
const americanExpressImagePath = 'assets/images/card/american-express.png';
const maestroImagePath = 'assets/images/card/maestro.png';

class PaymentPageModel extends ChangeNotifier {
  PaymentPageModel({
    @required Store<AppState> store,
  }) : _store = store {}

  final Store<AppState> _store;

  String getCardImagePath(CardType cardType) {
    if (cardType == CardType.visa) {
      return visaImagePath;
    } else if (cardType == CardType.masterCard) {
      return masterCardImagePath;
    } else if (cardType == CardType.americanExpress) {
      return americanExpressImagePath;
    } else if (cardType == CardType.maestro) {
      return maestroImagePath;
    }
    return 'カード';
  }

  String getCardNumber(String cardNumber) {
    return 'XXXX-XXXX-${cardNumber.substring(10)}';
  }

  void onTapCard(int index) {
    print('onTapped');
    final card = _store.state.cardList[index];
    _store.dispatch(UpdateSelectedCardItemAction(cardItem: card));
    notifyListeners();
  }

  Future<void> onTapProceedCheckOut(BuildContext context) async {
    LoadingOverlay.of(context).during(milliseconds: 2000);
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        return showDialog<SimpleDialog>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('ご購入ありがとうございます。'),
              children: [
                ElevatedButton(
                  onPressed: () {
                    _store
                      ..dispatch(
                          EmptyCartAction(itemList: _store.state.itemList))
                      ..dispatch(ResetTotalItemCountAction())
                      ..dispatch(ResetTotalPriceAction());
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Text('ホームへ戻る'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
