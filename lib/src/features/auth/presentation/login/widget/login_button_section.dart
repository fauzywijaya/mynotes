import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/routes/routes.dart';
import 'package:notes/src/shared/extensions/extensions.dart';

class LoginButtonSection extends StatelessWidget {
  const LoginButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonWidget.outlined(
          text: 'Login',
          onTap: () {
            context.goNamed(Routes.home.name);
          },
        ),
        Gap.h32,
        GestureDetector(
          onTap: () {
            context.goNamed(Routes.register.name);
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
