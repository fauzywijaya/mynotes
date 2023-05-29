import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/features/presentation.dart';
import 'package:notes/src/routes/app_routes.dart';

class RegisterButtonSection extends ConsumerWidget {
  const RegisterButtonSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);
    final controller = ref.read(registerControllerProvider.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonWidget.outlined(
          text: 'Register',
          onTap: controller.register,
          isLoading: state.isLoading,
        ),
        Gap.h32,
        GestureDetector(
          onTap: () {
            context.goNamed(Routes.login.name);
          },
          child: Text(
            'Already have an account? Login',
            style: TypographyApp.headline3,
          ),
        ),
      ],
    );
  }
}
