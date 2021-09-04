import 'package:flutter/material.dart';

class HomePageModel with ChangeNotifier {
  HomePageModel({
    required this.vsync,
  }) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController!);
  }

  final TickerProvider vsync;

  AnimationController? _animationController;
  AnimationController get animationController => _animationController!;

  Animation<double>? _animation;
  Animation<double> get animation => _animation!;

  bool _isOpened = true;
  bool get isOpened => _isOpened;

  @override
  void dispose() {
    if (_animationController != null) {
      _animationController!.dispose();
      _animationController = null;
    }

    super.dispose();
  }

  void _toggleIsOpened() {
    _isOpened = !_isOpened;
    notifyListeners();
  }

  void onTapTextButton() {
    if (_isOpened) {
      _animationController!.forward().whenComplete(() => _toggleIsOpened());
    } else {
      _animationController!.reverse().whenComplete(() => _toggleIsOpened());
    }
  }
}
