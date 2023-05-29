// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:notes/src/features/auth/application/auth_service.dart';
import 'package:notes/src/features/auth/domain/request_login.dart';
import 'package:notes/src/features/presentation.dart';

class LoginController extends StateNotifier<LoginState> {
  final AuthService _authService;
  LoginController(
    this._authService,
  ) : super(const LoginState());

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void onObsecureTap() {
    state = state.copyWith(
      isObscure: !state.isObscure,
    );
  }

  Future<void> login() async {
    state = state.copyWith(
      loginValue: const AsyncLoading(),
    );

    final requestLogin = RequestLogin(
      username: usernameController.text,
      password: passwordController.text,
    );

    final result = await _authService.login(requestLogin);

    result.when(
      success: (data) {
        state = state.copyWith(
          loginValue: const AsyncData("Login Success"),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          loginValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>((ref) {
  final authService = ref.read(authServiceProvider);
  return LoginController(authService);
});
