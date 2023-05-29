import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/features/presentation.dart';
import 'package:notes/src/routes/app_routes.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(registerControllerProvider, (prevState, state) {
      if (prevState?.registerValue != state.registerValue) {
        state.registerValue.whenOrNull(
          data: (data) {
            if (data != null) {
              context.goNamed(Routes.login.name);
            }
          },
          error: (error, stackTrace) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.toString()),
              ),
            );
          },
        );
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeApp.h32,
            vertical: SizeApp.h16,
          ),
          child: Column(
            children: [
              const Spacer(),
              const RegisterFormSection(),
              Gap.h32,
              const RegisterButtonSection(),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
