import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'todo_repository.dart';

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return const TodoRepository();
});
