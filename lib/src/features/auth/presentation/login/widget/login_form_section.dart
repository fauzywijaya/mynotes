import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/features/presentation.dart';

class LoginFormSection extends ConsumerWidget {
  const LoginFormSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final controller = ref.read(loginControllerProvider.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InputFormWidget(
          controller: controller.usernameController,
          hintText: 'Email',
          onChanged: (value) {},
        ),
        Gap.h16,
        InputFormWidget.password(
          controller: controller.passwordController,
          hintText: "Password",
          onChanged: (value) {},
          isObscure: state.isObscure,
          onObscureTap: controller.onObsecureTap,
        ),
      ],
    );
  }
}
