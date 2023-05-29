import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/routes/app_routes.dart';

class RegisterButtonSection extends StatelessWidget {
  const RegisterButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonWidget.outlined(
          text: 'Register',
          onTap: () {},
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
