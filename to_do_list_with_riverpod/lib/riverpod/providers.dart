import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_with_riverpod/riverpod/to_do_list_notifier.dart';
import 'package:to_do_list_with_riverpod/view/home_page/home_page_model.dart';

final homePageProvider = ChangeNotifierProvider((ref) => HomePageModel());
final toDoListProvider = ChangeNotifierProvider((ref) => ToDoListNotifier());
