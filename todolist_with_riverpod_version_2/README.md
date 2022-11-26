# todolist_with_riverpod_version_2

Riverpod version 2 のプラクティス。

## バージョン

### Flutter 

```bash
$ fvm flutter --version
Flutter 3.3.9 • channel stable • https://github.com/flutter/flutter.git
Framework • revision b8f7f1f986 (4 days ago) • 2022-11-23 06:43:51 +0900
Engine • revision 8f2221fbef
Tools • Dart 2.18.5 • DevTools 2.15.0
```

### Packages

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_hooks: ^0.18.5+1
  hooks_riverpod: ^2.1.1
  riverpod_annotation: ^1.0.6
  freezed: ^2.2.1
  freezed_annotation: ^2.2.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  riverpod_generator: ^1.0.6
  build_runner: ^2.3.2
```

## 開発メモ

### Riverpod Generator

#### サンプルコード

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
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
}
```

以下のコマンドにて、`todo_list_view_model.g.dart` が生成される。

```bash
dart run build_runner build --delete-conflicting-outputs
```

### AsyncNotifier

#### サンプルコード

```dart
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
```

`AsyncValue` が保持する extension `when` メソッドを読んで、成功時のデータ `data`, エラー発生時の `error`、ローディング中の `loading` に応じた処理を追加する。


## Reference

- [Flutter Riverpod 2.0: The Ultimate Guide](https://codewithandrea.com/articles/flutter-state-management-riverpod/)
- [How to use Notifier and AsyncNotifier with the new Flutter Riverpod Generator](https://codewithandrea.com/articles/flutter-riverpod-async-notifier/)
