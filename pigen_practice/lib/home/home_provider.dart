import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pigen_practice/home/home_view_model.dart';

import 'home.dart';

final homeProvider = StateNotifierProvider<HomeViewModel, Home>(
  (ref) {
    return HomeViewModel();
  },
);
