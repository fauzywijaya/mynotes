import 'package:flutter/material.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/features/presentation.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
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
