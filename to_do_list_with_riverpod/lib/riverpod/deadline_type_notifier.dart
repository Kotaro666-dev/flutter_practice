import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';

class DeadlineTypeNotifier extends ChangeNotifier {
  DeadlineTypeNotifier({
    this.deadlineType = Deadline.unselected,
  });
  Deadline deadlineType;
}
