import 'package:online_supermarket/redux/state.dart';
import 'package:online_supermarket/redux/reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    itemList: updateItemListReducer(state.itemList, action),
    totalItemCount: updateTotalItemCountReducer(state.totalItemCount, action),
    totalPrice: updateTotalPriceReducer(state.totalPrice, action),
    cardList: updateSelectedCardReducer(state.cardList, action),
  );
}
