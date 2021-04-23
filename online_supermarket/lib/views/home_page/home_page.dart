import 'package:flutter/material.dart';
import 'package:online_supermarket/redux/state.dart';
import 'package:online_supermarket/views/tabs/tab_bar.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import 'home_page_model.dart';

class HomePage extends StatelessWidget {
  const HomePage._({Key key}) : super(key: key);

  static Widget withDependencies({
    @required Store<AppState> store,
    @required BuildContext context,
    Key key,
  }) =>
      ChangeNotifierProvider(
        key: key,
        create: (_context) => HomePageModel(
          store: store,
        ),
        child: const HomePage._(),
      );

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomePageModel>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.teal,
      ),
      bottomNavigationBar: BottomTabBar(store: model.store),
    );
  }
}
