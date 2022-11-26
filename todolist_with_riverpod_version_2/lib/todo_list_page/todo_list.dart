import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todolist_with_riverpod_version_2/entity/todo.dart';

part 'todo_list.freezed.dart';

@freezed
class TodoList with _$TodoList {
  factory TodoList({
    required List<Todo> data,
  }) = _TodoList;
}
