import 'package:flutter/material.dart';
import 'package:online_supermarket/models/card.dart';

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
  }

  String getCardNumber(String cardNumber) {
    return 'XXXX-XXXX-${cardNumber.substring(10)}';
  }

  void onTapCard() {}
}
