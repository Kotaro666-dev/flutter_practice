import 'package:flutter/material.dart';
import 'package:online_supermarket/redux/state.dart';
import 'package:online_supermarket/views/tabs/tab_bar_model.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomTabBarModel(store: store),
      child: Builder(
        builder: (BuildContext context) {
          final model = Provider.of<BottomTabBarModel>(context);
          return BottomNavigationBar(
            /// 以下の type を fixed　に指定することで、4つ以上の item を表示できるようにする
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Market',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'MyPage',
              ),
            ],
            currentIndex: model.currentIndex,
            selectedItemColor: Colors.green,
            onTap: model.onTapBottomTabBar,
          );
        },
      ),
    );
  }
}
