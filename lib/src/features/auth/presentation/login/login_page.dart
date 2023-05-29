import 'package:flutter/material.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/features/presentation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeApp.w32,
            vertical: SizeApp.h16,
          ),
          child: Column(
            children: [
              // Center(
              //   child: Assets.icons.myflixLogo.svg(
              //     width: context.screenWidthPercentage(0.32),
              //     fit: BoxFit.fitWidth,
              //   ),
              // ),
              const Spacer(),
              const LoginFormSection(),
              Gap.h32,
              const LoginButtonSection(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
