import 'package:flutter/material.dart';

import 'settings_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HomePage'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SettingsPage.routeName);
              },
              child: Text('Go To Settings'),
            )
          ],
        ),
      ),
    );
  }
}
