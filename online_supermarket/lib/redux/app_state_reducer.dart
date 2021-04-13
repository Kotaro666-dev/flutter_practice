import 'package:online_supermarket/redux/state.dart';
import 'package:online_supermarket/redux/reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    itemList: updateItemListReducer(state.itemList, action),
    totalSelectedItemCount: updateTotalSelectedItemCountReducer(
        state.totalSelectedItemCount, action),
  );
}
