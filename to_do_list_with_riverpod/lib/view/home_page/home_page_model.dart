import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/mixin/add_to_do_mixin.dart';
import 'package:to_do_list_with_riverpod/mixin/get_deadline_details_mixin.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';
import 'package:to_do_list_with_riverpod/view/task_list_page/task_list_page.dart';

class HomePageModel extends ChangeNotifier
    with GetDeadlineDetailsMixin, AddToDoMixin {
  HomePageModel() {
    initialize();
  }

  void onTapDeadlineListItem(BuildContext context, Deadline deadlineType) {
    Navigator.pushNamed(
      context,
      TaskListPage.routeName,
      arguments: TaskListPageArgument(deadlineType: deadlineType),
    );
  }
}
