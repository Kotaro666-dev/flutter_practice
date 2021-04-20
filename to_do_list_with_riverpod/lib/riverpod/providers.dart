import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';
import 'package:to_do_list_with_riverpod/riverpod/deadline_category_notifier.dart';
import 'package:to_do_list_with_riverpod/riverpod/deadline_type_notifier.dart';
import 'package:to_do_list_with_riverpod/riverpod/to_do_list_notifier.dart';
import 'package:to_do_list_with_riverpod/view/category_page/category_page_model.dart';
import 'package:to_do_list_with_riverpod/view/home_page/home_page_model.dart';

final deadlineTypeProvider =
    ChangeNotifierProvider((ref) => DeadlineTypeNotifier());
final homePageProvider = ChangeNotifierProvider((ref) => HomePageModel());
final toDoListProvider = ChangeNotifierProvider((ref) => ToDoListNotifier());
// final toDoListProvider =
//     ChangeNotifierProvider.family<ToDoListNotifier, Deadline>(
//         (ref, type) => ToDoListNotifier(deadlineType: type));
final deadlineListProvider =
    ChangeNotifierProvider((ref) => DeadlineListNotifier());
final categoryPageProvider =
    ChangeNotifierProvider((ref) => CategoryPageModel());
