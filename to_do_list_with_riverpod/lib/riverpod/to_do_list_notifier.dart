import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';

class ToDoListNotifier extends ChangeNotifier {
  ToDoListNotifier() {
    _initialize();
  }

  List<ToDoItem> _toDoList;
  List<ToDoItem> get toDoList => _toDoList;

  void _initialize() {
    _toDoList = [];
  }

  void addNewToDoItem(String content, Deadline deadline) {
    final newToDo = ToDoItem(
      id: _toDoList.isEmpty ? 1 : _toDoList.last.id + 1,
      content: content,
      deadline: deadline,
      isDone: false,
    );
    _toDoList.add(newToDo);
    notifyListeners();
  }

  void removeNewToDoItem(int id) {
    _toDoList.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
