import 'package:online_supermarket/models/card.dart';
import 'package:online_supermarket/models/item.dart';
import 'package:online_supermarket/redux/action.dart';

List<Item> updateItemListReducer(List<Item> itemList, dynamic action) {
  if (action is IncrementItemAction) {
    action.updateItem.count++;

    return itemList
        .map((item) =>
            item.name == action.updateItem.name ? action.updateItem : item)
        .toList();
  }
  if (action is DecrementItemAction) {
    if (action.updateItem.count == 0) {
      return itemList;
    }
    action.updateItem.count--;

    return itemList
        .map((item) =>
            item.name == action.updateItem.name ? action.updateItem : item)
        .toList();
  }
  if (action is EmptyCartAction) {
    for (final item in action.itemList) {
      item.count = 0;
    }
    return action.itemList;
  }
  return itemList;
}

int updateTotalItemCountReducer(int totalItemCount, dynamic action) {
  if (action is IncrementTotalItemCountAction) {
    return action.totalItemCount + 1;
  }
  if (action is DecrementTotalItemCountAction) {
    return action.totalItemCount - 1;
  }
  if (action is ResetTotalItemCountAction) {
    return 0;
  }
  return totalItemCount;
}

int updateTotalPriceReducer(int totalPrice, dynamic action) {
  if (action is UpdateTotalPriceAction) {
    return action.totalPrice;
  }
  if (action is ResetTotalPriceAction) {
    return 0;
  }
  return totalPrice;
}

List<PaymentCard> updateSelectedCardReducer(
    List<PaymentCard> cardList, dynamic action) {
  if (action is UpdateSelectedCardItemAction) {
    action.cardItem.isSelected = true;
    return cardList
        .map(
          (card) => card.number == action.cardItem.number
              ? action.cardItem
              : card.copyWith(isSelected: false),
        )
        .toList();
  }
  return cardList;
}
