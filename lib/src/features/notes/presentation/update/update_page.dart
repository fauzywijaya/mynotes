import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/constants/constants.dart';

class UpdatePage extends ConsumerWidget {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(20),
          color: ColorApp.white,
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BottomSheetHolder(),
                Gap.h20,
                Text(
                  'Add Review',
                  style: TypographyApp.headline3,
                  textAlign: TextAlign.start,
                ),
                Gap.h20,
                LabelTextField(
                  hintText: 'Input your title here...',
                  labelText: 'Title',
                  onChanged: ((value) {}),
                ),
                Gap.h20,
                LabelTextField(
                  hintText: 'Input your Description here...',
                  labelText: 'Description',
                  maxLines: 4,
                  onChanged: ((value) {}),
                ),
                Gap.h40,
                RegularButton(
                  text: 'Submit',
                  onPressed: () {},
                ),
                Gap.h20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
