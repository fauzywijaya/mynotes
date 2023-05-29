import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/shared/extensions/extensions.dart';

class LabelTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final int? maxLines;
  final Function(String? value) onChanged;
  const LabelTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TypographyApp.text1),
        Gap.h8,
        TextField(
          decoration: InputDecoration(
            fillColor: ColorApp.lightGrey,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.solid,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeApp.w16, vertical: SizeApp.h12),
            hintText: hintText,
            hintStyle: TypographyApp.text2.grey,
          ),
          onChanged: onChanged,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
