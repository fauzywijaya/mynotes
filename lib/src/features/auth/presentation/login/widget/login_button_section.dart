import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/features/presentation.dart';
import 'package:notes/src/shared/extensions/extensions.dart';

class LoginButtonSection extends ConsumerWidget {
  const LoginButtonSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final controller = ref.read(loginControllerProvider.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonWidget.outlined(
          text: 'Login',
          onTap: controller.login,
          isLoading: state.isLoading,
        ),
        Gap.h32,
        GestureDetector(
          onTap: () {
            context.go('/register');
          },
          child: Text(
            'Not a Member yet? Register Here',
            style: TypographyApp.headline3,
          ),
        ),
        Gap.h16,
        Text(
          'Forgot Password?',
          style: TypographyApp.text1.grey,
        )
      ],
    );
  }
}
