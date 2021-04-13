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
  return itemList;
}

int updateTotalSelectedItemCountReducer(int itemCount, dynamic action) {
  if (action is IncrementTotalSelectedItemCountAction) {
    return action.totalItemSelectedCount + 1;
  }
  if (action is DecrementTotalSelectedItemCountAction) {
    return action.totalItemSelectedCount - 1;
  }
  return itemCount;
}
