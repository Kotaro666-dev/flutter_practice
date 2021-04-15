import 'package:online_supermarket/models/item.dart';
import 'package:online_supermarket/models/item_list_data_base.dart';

class AppState {
  AppState({this.itemList, this.totalItemCount, this.totalPrice});

  factory AppState.initialize() => AppState(
        itemList: itemListDB,
        totalItemCount: 0,
        totalPrice: 0,
      );

  List<Item> itemList;
  int totalItemCount;
  int totalPrice;
}
