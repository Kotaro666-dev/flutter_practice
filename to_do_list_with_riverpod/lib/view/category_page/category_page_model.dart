import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/mixin/add_to_do_mixin.dart';
import 'package:to_do_list_with_riverpod/mixin/get_deadline_details_mixin.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';
import 'package:to_do_list_with_riverpod/view/home_page/home_page.dart';

class CategoryPageModel extends ChangeNotifier
    with GetDeadlineDetailsMixin, AddToDoMixin {
  CategoryPageModel() {
    initialize();
  }

  void onTapDeadlineListItem(BuildContext context, Deadline deadlineType) {
    Navigator.pushNamed(
      context,
      HomePage.routeName,
      arguments: HomePageArgument(deadlineType: deadlineType),
    );
  }
}
