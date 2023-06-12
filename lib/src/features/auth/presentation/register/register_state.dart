// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterState {
  final AsyncValue<String?> registerValue;
  final bool isObscure;
  const RegisterState({
    this.registerValue = const AsyncData(null),
    this.isObscure = true,
  });

  bool get isLoading => registerValue.isLoading;

  RegisterState copyWith({
    AsyncValue<String?>? registerValue,
    bool? isObscure,
  }) {
    return RegisterState(
      registerValue: registerValue ?? this.registerValue,
      isObscure: isObscure ?? this.isObscure,
    );
  }
}
