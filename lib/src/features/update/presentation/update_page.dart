import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/common_widget/input_form/label_text_field.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/exceptions/network_exceptions.dart';
import 'package:notes/src/features/add/presentation/add_controller.dart';
import 'package:notes/src/shared/extensions/extensions.dart';

class UpdatePage extends ConsumerWidget {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValueAdd = ref.watch(addControllerProvider);
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
                  onChanged: ((value) {
                    ref.read(addControllerProvider.notifier).titleChange(value);
                  }),
                ),
                Gap.h20,
                LabelTextField(
                  hintText: 'Input your Description here...',
                  labelText: 'Description',
                  maxLines: 4,
                  onChanged: ((value) {
                    ref
                        .read(addControllerProvider.notifier)
                        .descriptionChange(value);
                  }),
                ),
                Gap.h40,
                RegularButton(
                  text: 'Submit',
                  isLoading: asyncValueAdd.isLoading,
                  onPressed: () {
                    ref.read(addControllerProvider.notifier).postReview();
                  },
                ),
                Gap.h20,
                asyncValueAdd.maybeWhen(
                  error: (error, stacktrace) => Text(
                    'Failed Add Review!: ${NetworkExceptions.getErrorMessage(error as NetworkExceptions)}',
                    style: TypographyApp.text1.red,
                  ),
                  orElse: () => Container(),
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
