import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/mixin/add_to_do_mixin.dart';
import 'package:to_do_list_with_riverpod/mixin/get_deadline_details_mixin.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';

class TaskListPageModel extends ChangeNotifier
    with GetDeadlineDetailsMixin, AddToDoMixin {
  TaskListPageModel({this.currentPage}) {
    initialize(currentPage);
  }

  final Deadline currentPage;
}
