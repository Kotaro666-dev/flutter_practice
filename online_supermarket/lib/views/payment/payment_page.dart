import 'package:flutter/material.dart';
import 'package:online_supermarket/views/payment/payment_page_model.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:online_supermarket/redux/state.dart';

import '../../redux/state.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({this.store});
  final Store<AppState> store;

  static const routeName = '/payment_page';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaymentPageModel(
        store: store,
      ),
      child: Builder(
        builder: (BuildContext context) {
          final model = Provider.of<PaymentPageModel>(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text('カート'),
            ),
            body: SafeArea(
              child: Container(
                child: Text(
                  'PaymentPage',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
