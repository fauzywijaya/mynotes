import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/shared/extensions/extensions.dart';

class RegularButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  const RegularButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !isLoading ? onPressed : null,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: SizeApp.h12,
          horizontal: SizeApp.w32,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ColorApp.red,
        ),
        child: !isLoading
            ? Text(
                text,
                style: TypographyApp.text1.white.bold,
                textAlign: TextAlign.center,
              )
            : Center(
                child: SizedBox(
                  height: SizeApp.h16,
                  width: SizeApp.w16,
                  child: const CircularProgressIndicator(
                    color: ColorApp.white,
                  ),
                ),
              ),
      ),
    );
  }
}
