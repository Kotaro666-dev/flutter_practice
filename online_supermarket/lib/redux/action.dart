import 'package:online_supermarket/models/item.dart';

class IncrementItemAction {
  IncrementItemAction({this.updateItem});

  final Item updateItem;
}

class DecrementItemAction {
  DecrementItemAction({this.updateItem});

  final Item updateItem;
}

class IncrementTotalSelectedItemCountAction {
  IncrementTotalSelectedItemCountAction({this.totalItemSelectedCount});
  int totalItemSelectedCount;
}

class DecrementTotalSelectedItemCountAction {
  DecrementTotalSelectedItemCountAction({this.totalItemSelectedCount});
  int totalItemSelectedCount;
}
