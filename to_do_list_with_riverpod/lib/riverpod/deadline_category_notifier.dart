import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/model/deadline_list_item.dart';

class DeadlineListNotifier extends ChangeNotifier {
  DeadlineListNotifier() {
    _initialize();
  }

  DeadlineList _deadlineList;
  DeadlineList get deadlineList => _deadlineList;

  void _initialize() {
    _deadlineList = DeadlineList();
  }
}
