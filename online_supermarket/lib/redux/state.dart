import 'package:online_supermarket/models/item.dart';

class AppState {
  AppState({this.itemList});

  factory AppState.initialize() => AppState(
        itemList: <Item>[
          Item(
              name: 'にんじん',
              imagePath: 'assets/images/carrot.png',
              count: 0,
              price: 100),
          Item(
              name: 'キャベツ',
              imagePath: 'assets/images/cabbage.png',
              count: 0,
              price: 120),
          Item(
              name: 'じゃがいも',
              imagePath: 'assets/images/potato.png',
              count: 0,
              price: 80),
          Item(
              name: 'たまねぎ',
              imagePath: 'assets/images/onion.png',
              count: 0,
              price: 50),
          Item(
              name: '豚肉',
              imagePath: 'assets/images/pork.png',
              count: 0,
              price: 300),
          Item(
              name: '豚肉',
              imagePath: 'assets/images/pork.png',
              count: 0,
              price: 300),
          Item(
              name: '豚肉',
              imagePath: 'assets/images/pork.png',
              count: 0,
              price: 300),
          Item(
              name: '豚肉',
              imagePath: 'assets/images/pork.png',
              count: 0,
              price: 300),
        ],
      );

  List<Item> itemList;
}
