import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/model/deadline_list_item.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';

class DeadlineListNotifier extends ChangeNotifier {
  DeadlineListNotifier() {
    _initialize();
  }

  GlobalKey<AnimatedListState> _listKey;
  GlobalKey<AnimatedListState> get listKey => _listKey;

  DeadlineList _deadlineList;
  DeadlineList get deadlineList => _deadlineList;

  void _initialize() {
    _deadlineList = DeadlineList();
    _deadlineList
      ..todayList = mockTodayList
      ..tomorrowList = mockTomorrowList
      ..next7DaysList = mockThisWeekList
      ..duringThisMonthList = mockThisMonthList
      ..undecided = [];
    _listKey = GlobalKey<AnimatedListState>();
  }

  List<ToDoItem> getToDoList(Deadline deadline) {
    if (deadline == Deadline.today) {
      return _deadlineList.todayList;
    } else if (deadline == Deadline.tomorrow) {
      return _deadlineList.tomorrowList;
    } else if (deadline == Deadline.next7days) {
      return _deadlineList.next7DaysList;
    } else if (deadline == Deadline.duringThisMonth) {
      return _deadlineList.duringThisMonthList;
    } else if (deadline == Deadline.undecided) {
      return _deadlineList.undecided;
    }
    return null;
  }

  void addNewToDoItem({
    String content,
    Deadline selectedDeadlineType,
  }) {
    final list = getToDoList(selectedDeadlineType);
    final newToDo = ToDoItem(
      id: list.isEmpty ? 1 : list.last.id + 1,
      content: content,
      deadline: selectedDeadlineType,
      isSelected: false,
    );
    getToDoList(selectedDeadlineType).add(newToDo);
    notifyListeners();
  }

  void setItemIsSelectedTrue({int id, Deadline deadlineType}) {
    final targetIndex =
        getToDoList(deadlineType).indexWhere((item) => item.id == id);
    getToDoList(deadlineType)[targetIndex].isSelected = true;
    notifyListeners();
  }

  void removeNewToDoItem({int id, Deadline deadlineType}) {
    getToDoList(deadlineType).removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
