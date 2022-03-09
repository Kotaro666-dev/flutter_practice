import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_sample_with_riverpod/providers/loginStateProvider.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginStatus = ref.watch(loginStateProvider);
    final loginStatusNotifier = ref.watch(loginStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン状態'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loginStatus.isLoggedIn ? const Text('ログイン中') : const Text('未ログイン'),
          ElevatedButton(
            onPressed: () {
              if (!loginStatus.isLoggedIn) {
                loginStatusNotifier.login();
              } else {
                loginStatusNotifier.logout();
              }
            },
            child: !loginStatus.isLoggedIn
                ? const Text(
                    'ログイン',
                  )
                : const Text(
                    'ログアウト',
                  ),
          )
        ],
      ),
    );
  }
}
