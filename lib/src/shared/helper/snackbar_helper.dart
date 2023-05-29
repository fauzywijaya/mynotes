import 'package:flutter/material.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/shared/extensions/extensions.dart';

void showErrorSnackbar(BuildContext context, String error,
    {String? buttonText, VoidCallback? onTap}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              error,
              style: TypographyApp.text1.white,
            ),
          ),
          if (buttonText != null)
            InkWell(
              onTap: onTap,
              child: Text(
                buttonText,
                style: TypographyApp.text1.white,
              ),
            )
        ],
      ),
      backgroundColor: Colors.red,
    ),
  );
}

void showSuccessSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: TypographyApp.text1.white,
      ),
      backgroundColor: Colors.green,
    ),
  );
}

void showSuccessSnackbarWithAction(context, message, actionTitle, action) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: TypographyApp.text1.white,
          ),
          TextButton(
            onPressed: action,
            child: Text(
              actionTitle,
              style: TypographyApp.text1.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green,
    ),
  );
}

void showDefaultSnackbar(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TypographyApp.text1.white,
      ),
    ),
  );
}
