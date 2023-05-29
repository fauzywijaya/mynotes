import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/presentation.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(const RegisterState());

  final usernameController = TextEditingController();
  final birthdateController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final genderController = TextEditingController();
  void onObscureTap() {
    state = state.copyWith(
      isObsecure: !state.isObsecure,
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    birthdateController.dispose();
    emailController.dispose();
    passwordController.dispose();
    genderController.dispose();
    super.dispose();
  }
}

final registerControllerProvider =
    StateNotifierProvider.autoDispose<RegisterController, RegisterState>((ref) {
  return RegisterController();
});
