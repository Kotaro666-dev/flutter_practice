import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Reference: https://www.greycastle.se/loading-overlay-in-flutter/

class LoadingOverlay {
  LoadingOverlay._create(
    this._context,
  );
  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog<_FullScreenLoader>(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _FullScreenLoader();
      },
    );
  }

  void during({int milliseconds}) {
    show();
    Timer(Duration(milliseconds: milliseconds), hide);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
