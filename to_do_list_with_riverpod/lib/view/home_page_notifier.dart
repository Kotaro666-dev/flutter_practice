import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/constants/constant.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';

class HomePageNotifier extends ChangeNotifier {
  HomePageNotifier() {
    _initialize();
  }
  List<ToDoItem> _toDoList;
  List<ToDoItem> get toDoList => _toDoList;

  String _content = '';
  String get content => _content;

  TextEditingController _textEditingController;
  TextEditingController get textEditingController => _textEditingController;

  bool _isActive;
  bool get isActive => _isActive;

  void _initialize() {
    _toDoList = toDoStaticLists;
    _textEditingController = TextEditingController();
    _isActive = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void onChanged(String content) {
    _content = content;
    if (_content.isNotEmpty) {
      _isActive = true;
    } else {
      _isActive = false;
    }
    notifyListeners();
  }

  void onTapSubmitButton(BuildContext context) {
    final newToDo = ToDoItem(
      id: _toDoList.isEmpty ? 1 : _toDoList.last.id + 1,
      content: _content,
      deadline: Deadline.tomorrow,
      isDone: false,
    );
    _toDoList.add(newToDo);
    notifyListeners();
    _textEditingController.clear();
    _content = '';
    _isActive = false;
    notifyListeners();
  }

  String getDeadlineText(Deadline deadline) {
    if (deadline == Deadline.today) {
      return 'Today';
    } else if (deadline == Deadline.tomorrow) {
      return 'Tomorrow';
    } else if (deadline == Deadline.thisWeek) {
      return 'This Week';
    } else if (deadline == Deadline.thisMonth) {
      return 'This Month';
    } else {
      return '';
    }
  }

  Color getDeadlineColor(Deadline deadline) {
    if (deadline == Deadline.today) {
      return todayColor;
    } else if (deadline == Deadline.tomorrow) {
      return tomorrowColor;
    } else if (deadline == Deadline.thisWeek) {
      return thisWeekColor;
    } else if (deadline == Deadline.thisMonth) {
      return thisMonthColor;
    } else {
      return Colors.white;
    }
  }

  void onTapToDoDone(int id) {
    _toDoList.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
