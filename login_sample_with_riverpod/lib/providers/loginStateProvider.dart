import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_sample_with_riverpod/states/login_state.dart';

final loginStateProvider =
    StateNotifierProvider<LoginStateProvider, LoginState>((ref) {
  return LoginStateProvider();
});

class LoginStateProvider extends StateNotifier<LoginState> {
  LoginStateProvider() : super(LoginState());

  void login() {
    state = state.copyWith(
      isLoggedIn: true,
    );
  }

  void logout() {
    state = state.copyWith(
      isLoggedIn: false,
    );
  }
}
