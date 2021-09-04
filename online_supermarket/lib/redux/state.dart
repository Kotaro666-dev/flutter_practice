import 'package:online_supermarket/models/card.dart';
import 'package:online_supermarket/models/item.dart';
import 'package:online_supermarket/models/item_list_data_base.dart';
import 'package:online_supermarket/models/payment_card_data_base.dart';

class AppState {
  AppState({
    required this.itemList,
    required this.totalItemCount,
    required this.totalPrice,
    required this.cardList,
  });

  factory AppState.initialize() => AppState(
        itemList: itemListDB,
        totalItemCount: 0,
        totalPrice: 0,
        cardList: cardListDB,
      );

  List<Item> itemList;
  int totalItemCount;
  int totalPrice;
  List<PaymentCard> cardList;
}
