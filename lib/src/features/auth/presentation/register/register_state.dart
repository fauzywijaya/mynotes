class RegisterState {
  final bool isObsecure;
  const RegisterState({
    this.isObsecure = true,
  });

  RegisterState copyWith({
    bool? isObsecure,
  }) {
    return RegisterState(
      isObsecure: isObsecure ?? this.isObsecure,
    );
  }
}
