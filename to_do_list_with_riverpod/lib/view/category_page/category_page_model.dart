import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';
import 'package:to_do_list_with_riverpod/view/home_page/home_page.dart';

class CategoryPageModel extends ChangeNotifier {
  void onTapDeadlineListItem(BuildContext context, Deadline deadlineType) {
    Navigator.pushNamed(
      context,
      HomePage.routeName,
      arguments: HomePageArgument(deadlineType: deadlineType),
    );
  }
}
