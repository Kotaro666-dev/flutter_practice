import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todolist_with_riverpod_version_2/entity/todo.dart';
import 'package:todolist_with_riverpod_version_2/todo_list_page/todo_list.dart';
import 'package:todolist_with_riverpod_version_2/todo_list_page/todo_list_view_model.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List Page'),
      ),
      body: const _Body(),
      floatingActionButton: Consumer(builder: (
        BuildContext context,
        WidgetRef ref,
        Widget? __,
      ) {
        return FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            ref
                .read(todoListViewModelProvider.notifier)
                .goToTodoAddPage(context);
          },
        );
      }),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(todoListViewModelProvider);
    return provider.when(
      data: (TodoList data) {
        final todoList = data.data;
        return ListView.builder(
          itemCount: todoList.length,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (BuildContext context, int index) {
            final todo = todoList[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: _TodoItem(todo: todo),
            );
          },
        );
      },
      error: (Object error, StackTrace stackTrace) => Center(
        child: Text(
          error.toString(),
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _TodoItem extends HookConsumerWidget {
  const _TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDone = useState(false);
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(todo.title),
          GestureDetector(
            onTap: () {
              isDone.value = !isDone.value;
              ref.read(todoListViewModelProvider.notifier).removeTodo(todo.id);
            },
            child: !isDone.value
                ? const Icon(Icons.check_box_outline_blank_sharp)
                : const Icon(Icons.check_box),
          ),
        ],
      ),
    );
  }
}
