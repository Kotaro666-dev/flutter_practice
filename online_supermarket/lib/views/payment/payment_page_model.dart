import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/state.dart';

class PaymentPageModel extends ChangeNotifier {
  PaymentPageModel({
    @required Store<AppState> store,
  }) : _store = store {}

  final Store<AppState> _store;
}
