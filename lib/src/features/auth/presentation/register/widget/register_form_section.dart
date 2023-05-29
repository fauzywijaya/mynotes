import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/features/presentation.dart';

class RegisterFormSection extends ConsumerWidget {
  const RegisterFormSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);
    final controller = ref.read(registerControllerProvider.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InputFormWidget(
          controller: controller.usernameController,
          hintText: "Username",
          onChanged: (value) {},
        ),
        Gap.h16,
        InputFormWidget.password(
          controller: controller.passwordController,
          hintText: "Password",
          onObscureTap: controller.onObscureTap,
          isObscure: state.isObsecure,
        ),
        Gap.h16,
        InputFormWidget(
          controller: controller.fullnameController,
          hintText: "Full Name",
          onChanged: (value) {},
        ),
        Gap.h16,
      ],
    );
  }
}
