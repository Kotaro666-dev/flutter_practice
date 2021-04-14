import 'package:online_supermarket/models/item.dart';

class AppState {
  AppState({this.itemList, this.totalItemCount, this.totalPrice});

  factory AppState.initialize() => AppState(
        itemList: <Item>[
          Item(
            name: 'にんじん',
            imagePath: 'assets/images/carrot.png',
            count: 0,
            price: 100,
            category: MyCategory.vegetables,
          ),
          Item(
            name: 'キャベツ',
            imagePath: 'assets/images/cabbage.png',
            count: 0,
            price: 120,
            category: MyCategory.vegetables,
          ),
          Item(
            name: 'じゃがいも',
            imagePath: 'assets/images/potato.png',
            count: 0,
            price: 80,
            category: MyCategory.vegetables,
          ),
          Item(
            name: 'たまねぎ',
            imagePath: 'assets/images/onion.png',
            count: 0,
            price: 50,
            category: MyCategory.vegetables,
          ),
          Item(
            name: '豚肉',
            imagePath: 'assets/images/pork.png',
            count: 0,
            price: 300,
            category: MyCategory.meat,
          ),
          Item(
            name: '牛肉',
            imagePath: 'assets/images/beef.png',
            count: 0,
            price: 500,
            category: MyCategory.meat,
          ),
          Item(
            name: '卵',
            imagePath: 'assets/images/eggs.png',
            count: 0,
            price: 200,
            category: MyCategory.fruits,
          ),
          Item(
            name: 'アボカド',
            imagePath: 'assets/images/avocado.png',
            count: 0,
            price: 100,
            category: MyCategory.fruits,
          ),
        ],
        totalItemCount: 0,
        totalPrice: 0,
      );

  List<Item> itemList;
  int totalItemCount;
  int totalPrice;
}
