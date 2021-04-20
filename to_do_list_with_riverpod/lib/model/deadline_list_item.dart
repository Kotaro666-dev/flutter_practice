import 'package:to_do_list_with_riverpod/model/to_do_item.dart';

class DeadlineList {
  DeadlineList({
    this.todayList = const [],
    this.tomorrowList = const [],
    this.thisWeekList = const [],
    this.thisMonthList = const [],
  });

  List<ToDoItem> todayList;
  List<ToDoItem> tomorrowList;
  List<ToDoItem> thisWeekList;
  List<ToDoItem> thisMonthList;
}
