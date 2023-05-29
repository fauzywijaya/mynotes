import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/shared/extensions/extensions.dart';

class BottomSheetHolder extends StatelessWidget {
  const BottomSheetHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ColorApp.black,
        ),
        height: SizeApp.h4,
        width: context.screenWidth * 0.12,
      ),
    );
  }
}
