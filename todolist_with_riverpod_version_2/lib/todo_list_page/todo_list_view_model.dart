import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repository/todo_repository_provider.dart';
import '../todo_add_page/todo_add_page.dart';
import 'todo_list.dart';

import '../entity/todo.dart';

part 'todo_list_view_model.g.dart';

@riverpod
class TodoListViewModel extends _$TodoListViewModel {
  @override
  FutureOr<TodoList> build() async {
    final todoRepository = ref.read(todoRepositoryProvider);

    /// 永続化データからの取得 or サーバとの連携処理
    final todoList = await todoRepository.getTodoList();

    /// 疑似的なローディング時間を設ける
    await Future.delayed(const Duration(seconds: 3));
    return TodoList(data: todoList);
  }

  Future<void> goToTodoAddPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const TodoAddPage();
        },
      ),
    );

    final isNewTodo = result != null;
    if (!isNewTodo) {
      return;
    }
    _addTodo(result as String);
  }

  int _getLatestTodoId(List<Todo> todoList) {
    return todoList[todoList.length - 1].id + 1;
  }

  Future<void> _addTodo(String title) async {
    final todoRepository = ref.read(todoRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final currentTodoList = [...?state.value?.data];
      final latestTodoId = _getLatestTodoId(currentTodoList);
      final newTodo = Todo(id: latestTodoId, title: title);
      currentTodoList.add(newTodo);

      /// データの永続化 or サーバとの連携処理
      await todoRepository.setTodoList(currentTodoList);

      /// 疑似的なローディング時間を設ける
      await Future.delayed(const Duration(seconds: 1));

      return TodoList(data: currentTodoList);
    });
  }

  Future<void> removeTodo(int id) async {
    final todoRepository = ref.read(todoRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final currentTodoList = [...?state.value?.data];
      currentTodoList.removeWhere((element) => element.id == id);

      /// データの永続化 or サーバとの連携処理
      await todoRepository.setTodoList(currentTodoList);

      /// 疑似的なローディング時間を設ける
      await Future.delayed(const Duration(seconds: 1));

      return TodoList(data: currentTodoList);
    });
  }
}
