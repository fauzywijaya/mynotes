import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:notes/src/constants/constants.dart';

void showRegularBottomSheet(context, {required Widget child}) {
  if (Platform.isIOS) {
    showCupertinoModalBottomSheet(
      expand: false,
      context: context,
      enableDrag: true,
      topRadius: Radius.circular(SizeApp.h20),
      backgroundColor: Colors.transparent,
      builder: (context) => child,
    );
  } else {
    showMaterialModalBottomSheet(
      expand: false,
      context: context,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (context) => child,
    );
  }
}
