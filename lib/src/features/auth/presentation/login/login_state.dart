// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginState {
  final bool isObscure;
  const LoginState({
    this.isObscure = true,
  });

  LoginState copyWith({
    bool? isObscure,
  }) {
    return LoginState(
      isObscure: isObscure ?? this.isObscure,
    );
  }
}
