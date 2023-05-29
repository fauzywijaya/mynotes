import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/shared/extensions/extensions.dart';

enum InputFormType {
  normal,
  password,
  button,
}

class InputFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String value)? onChanged;
  final bool isObscure;
  final Function()? onObscureTap;
  final InputFormType inputFormType;
  final bool readOnly;
  final VoidCallback? onTap;

  const InputFormWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
  })  : inputFormType = InputFormType.normal,
        isObscure = false,
        readOnly = false,
        onObscureTap = null,
        onTap = null;

  const InputFormWidget.password({
    super.key,
    required this.controller,
    required this.hintText,
    this.onTap,
    this.onChanged,
    this.onObscureTap,
    this.isObscure = true,
  })  : inputFormType = InputFormType.password,
        readOnly = false;

  bool get isPassword => inputFormType == InputFormType.password;

  const InputFormWidget.button({
    super.key,
    required this.controller,
    required this.hintText,
    this.onTap,
  })  : inputFormType = InputFormType.button,
        isObscure = false,
        readOnly = true,
        onChanged = null,
        onObscureTap = null;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      readOnly: readOnly,
      onTap: onTap,
      obscureText: isObscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorApp.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: ColorApp.lightBlue, width: 0.8),
        ),
        hintText: hintText,
        hintStyle: TypographyApp.text1.white,
        suffix: isPassword
            ? GestureDetector(
                onTap: onObscureTap,
                child: Text(
                  isObscure ? 'SHOW' : 'HIDE',
                  style: TypographyApp.text1.grey,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
