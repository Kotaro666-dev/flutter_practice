import 'package:flutter/material.dart';
import 'package:online_supermarket/views/payment/payment_page_model.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/state.dart';

import '../../redux/state.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({this.store});

  final Store<AppState> store;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaymentPageModel(
        store: store,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            final model = Provider.of<PaymentPageModel>(context);
            return Text('${model.sum}');
          },
        ),
      ),
    );
  }
}
