import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/exceptions/network_exceptions.dart';
import 'package:notes/src/features/presentation.dart';
import 'package:notes/src/shared/extensions/extensions.dart';
import 'package:notes/src/shared/helper/snackbar_helper.dart';

class AddPage extends ConsumerWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addControllerProvider);
    final controller = ref.read(addControllerProvider.notifier);

    ref.listen(addControllerProvider, (previous, next) {
      next.postNoteValue.maybeWhen(
          data: (data) {
            if (data != null) {
              Navigator.of(context).pop();
              showSuccessSnackbar(context, "Success Add Note");
            }
          },
          orElse: (() {}));
    });
    return Material(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(20),
          color: ColorApp.darkGrey,
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BottomSheetHolder(),
                Gap.h20,
                Text(
                  'Add Notes',
                  style: TypographyApp.headline3,
                  textAlign: TextAlign.start,
                ),
                Gap.h20,
                InputFormWidget(
                  controller: controller.titleController,
                  hintText: "Input your title here...",
                  validator: controller.validateTitle,
                  onChanged: ((value) {}),
                ),
                Gap.h20,
                InputFormWidget(
                  controller: controller.descController,
                  hintText: "Input your Description here...",
                  maxLines: 4,
                  validator: controller.validateDesc,
                  onChanged: ((value) {}),
                ),
                Gap.h40,
                ButtonWidget.primary(
                  text: "SUBMIT",
                  onTap: controller.postNotes,
                  isLoading: state.isLoading,
                  // isEnabled: state.isValid,
                ),
                Gap.h20,
                state.postNoteValue.maybeWhen(
                    error: (error, stackTrace) {
                      return Text(
                        'Failed to Add Note: ${NetworkExceptions.getErrorMessage(error as NetworkExceptions)}',
                        style: TypographyApp.text1.red,
                      );
                    },
                    orElse: () => const SizedBox.shrink())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
