import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_with_riverpod/riverpod/deadline_list_notifier.dart';
import 'package:to_do_list_with_riverpod/view/home_page/home_page_model.dart';
import 'package:to_do_list_with_riverpod/view/task_list_page/task_list_page_model.dart';

final homePageProvider = ChangeNotifierProvider((ref) => TaskListPageModel());
final deadlineListProvider =
    ChangeNotifierProvider((ref) => DeadlineListNotifier());
final categoryPageProvider = ChangeNotifierProvider((ref) => HomePageModel());
