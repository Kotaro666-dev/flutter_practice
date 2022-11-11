import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home.dart';

class HomeViewModel extends StateNotifier<Home> {
  HomeViewModel()
      : super(
          Home(id: 100),
        );

  void onPressedProceedMethodChannel() {}

  void onPressedReset() {}
}
