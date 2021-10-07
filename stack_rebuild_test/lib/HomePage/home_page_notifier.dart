import 'dart:async';

import 'package:flutter/material.dart';

class HomePageNotifier extends ChangeNotifier {
  HomePageNotifier() {
    _initialize();
  }

  Color _firstColor = Colors.grey;
  Color get firstColor => _firstColor;

  Color _secondColor = Colors.blueGrey;
  Color get secondColor => _secondColor;

  void _initialize() {
    _updateBoxColor();
  }

  Future<void> _updateBoxColor() async {
    await Future.delayed(const Duration(seconds: 3));
    _firstColor = Colors.greenAccent;
    _secondColor = Colors.blueAccent;
    notifyListeners();
  }

  void onTapResetButton() {
    _firstColor = Colors.grey;
    _secondColor = Colors.blueGrey;
    notifyListeners();
    _updateBoxColor();
  }
}
