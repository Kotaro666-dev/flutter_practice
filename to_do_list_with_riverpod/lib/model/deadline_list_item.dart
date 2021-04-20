import 'package:to_do_list_with_riverpod/model/to_do_item.dart';

class DeadlineList {
  DeadlineList({
    this.todayList,
    this.tomorrowList,
    this.thisWeekList,
    this.thisMonthList,
    this.unselectedList,
  });

  List<ToDoItem> todayList;
  List<ToDoItem> tomorrowList;
  List<ToDoItem> thisWeekList;
  List<ToDoItem> thisMonthList;
  List<ToDoItem> unselectedList;
}
