import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:online_supermarket/constants/constant.dart';
import 'package:online_supermarket/models/card.dart';
import 'package:online_supermarket/progress_indicator.dart';
import 'package:online_supermarket/redux/action.dart';

import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/state.dart';

class PaymentPageModel extends ChangeNotifier {
  PaymentPageModel({
    required Store<AppState> store,
  }) : _store = store;

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
    } else {
      return defaultImagePath;
    }
  }

  String getCardNumber(String cardNumber) {
    return 'XXXX-XXXX-${cardNumber.substring(10)}';
  }

  void onTapCard(int index) {
    final card = _store.state.cardList[index];
    _store.dispatch(UpdateSelectedCardItemAction(cardItem: card));
    notifyListeners();
  }

  bool canProceedCheckOut() {
    for (final card in _store.state.cardList) {
      if (card.isSelected) {
        return true;
      }
    }
    return false;
  }

  Future<void> onTapProceedCheckOut(BuildContext context) async {
    const indicatorDisplayingTime = 2000;
    LoadingOverlay.of(context).during(indicatorDisplayingTime);
    Future.delayed(
      const Duration(milliseconds: indicatorDisplayingTime),
      () {
        return showFinishProceedingPurchaseDialog(context);
      },
    );
  }

  Future<void> showFinishProceedingPurchaseDialog(BuildContext context) {
    return showDialog<AlertDialog>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'ご購入ありがとうございます。',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('支払いが正常に完了しました。'),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _resetStateAndGoHome(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: kElevatedButtonBorderRadius,
                    ),
                    child: const Text(
                      'ホーム画面へ戻る',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _resetStateAndGoHome(BuildContext context) {
    _store
      ..dispatch(EmptyCartAction(itemList: _store.state.itemList))
      ..dispatch(ResetTotalItemCountAction())
      ..dispatch(ResetTotalPriceAction())
      ..dispatch(ResetSelectedCardItemAction(cardList: _store.state.cardList));
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
