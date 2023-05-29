import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/presentation.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(const RegisterState());

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();

  void onObscureTap() {
    state = state.copyWith(
      isObsecure: !state.isObsecure,
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
  return RegisterController();
});
