import 'package:online_supermarket/models/card.dart';
import 'package:online_supermarket/models/item.dart';

class IncrementItemAction {
  IncrementItemAction({this.updateItem});

  final Item updateItem;
}

class DecrementItemAction {
  DecrementItemAction({this.updateItem});

  final Item updateItem;
}

class EmptyCartAction {
  EmptyCartAction({this.itemList});
  final List<Item> itemList;
}

class IncrementTotalItemCountAction {
  IncrementTotalItemCountAction({this.totalItemCount});
  int totalItemCount;
}

class DecrementTotalItemCountAction {
  DecrementTotalItemCountAction({this.totalItemCount});
  int totalItemCount;
}

class ResetTotalItemCountAction {}

class UpdateTotalPriceAction {
  UpdateTotalPriceAction({this.totalPrice});
  final int totalPrice;
}

class ResetTotalPriceAction {}

class UpdateSelectedCardItemAction {
  UpdateSelectedCardItemAction({this.cardItem});
  final PaymentCard cardItem;
}
