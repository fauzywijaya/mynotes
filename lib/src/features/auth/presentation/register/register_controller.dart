import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/auth/application/auth_service.dart';
import 'package:notes/src/features/domain.dart';
import 'package:notes/src/features/presentation.dart';

class RegisterController extends StateNotifier<RegisterState> {
  final AuthService _authService;

  RegisterController(this._authService) : super(const RegisterState());

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();

  void onObscureTap() {
    state = state.copyWith(
      isObscure: !state.isObscure,
    );
  }

  Future<void> register() async {
    state = state.copyWith(registerValue: const AsyncLoading());

    final requestRegister = RequestRegister(
      username: usernameController.text,
      password: passwordController.text,
      fullname: fullnameController.text,
    );

    final result = await _authService.register(requestRegister);

    result.when(
      success: (data) {
        state =
            state.copyWith(registerValue: const AsyncData("Register Success"));
      },
      failure: (error, stackTrace) {
        state = state.copyWith(registerValue: AsyncError(error, stackTrace));
      },
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    super.dispose();
  }
}

final registerControllerProvider =
    StateNotifierProvider.autoDispose<RegisterController, RegisterState>((ref) {
  final authService = ref.read(authServiceProvider);
  return RegisterController(authService);
});
