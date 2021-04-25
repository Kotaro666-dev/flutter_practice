import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  static const routeName = '/payment_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaymentPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('PaymentPage'),
          ],
        ),
      ),
    );
  }
}
