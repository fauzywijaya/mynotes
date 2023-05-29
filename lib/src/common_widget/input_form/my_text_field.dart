import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  const MyTextField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        // suffixText: "RP",
      ),
      maxLines: 1,
    );
  }
}
