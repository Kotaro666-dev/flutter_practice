import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SettingsPage'),
          ],
        ),
      ),
    );
  }
}
