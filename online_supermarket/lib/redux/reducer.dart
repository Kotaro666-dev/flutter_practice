import 'package:online_supermarket/redux/action.dart';
import 'package:online_supermarket/redux/state.dart';

AppState updateItemListReducer(AppState state, dynamic action) {
  if (action is IncrementItemAction) {
    action.updateItem.count++;

    return AppState(
        itemList: state.itemList
            .map((item) =>
                item.name == action.updateItem.name ? action.updateItem : item)
            .toList());
  }
  if (action is DecrementItemAction) {
    if (action.updateItem.count == 0) {
      return state;
    }
    action.updateItem.count--;

    return AppState(
        itemList: state.itemList
            .map((item) =>
                item.name == action.updateItem.name ? action.updateItem : item)
            .toList());
  }
  return state;
}
