import '../entity/todo.dart';

class TodoRepository {
  const TodoRepository();

  Future<List<Todo>> getTodoList() async {
    // TODO: Implement
    return [
      Todo(id: 0, title: 'Sample Todo 00'),
      Todo(id: 1, title: 'Sample Todo 01'),
      Todo(id: 2, title: 'Sample Todo 02'),
    ];
  }

  Future<void> setTodoList(List<Todo> todoList) async {
    // TODO: Implement
  }
}
