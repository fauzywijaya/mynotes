// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:notes/src/common_widget/common_widget.dart';
import 'package:notes/src/constants/constants.dart';
import 'package:notes/src/exceptions/network_exceptions.dart';
import 'package:notes/src/features/notes/domain/note.dart';
import 'package:notes/src/features/presentation.dart';
import 'package:notes/src/shared/extensions/text_styles.dart';
import 'package:notes/src/shared/helper/snackbar_helper.dart';

class UpdatePage extends ConsumerWidget {
  final Note detailNote;
  const UpdatePage({
    super.key,
    required this.detailNote,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(updateControllerProvider.notifier);
    final state = ref.watch(updateControllerProvider);
    // final value = controller.getNoteDetail(noteId: noteId);
    ref.listen(updateControllerProvider, (previous, next) {
      next.updateNoteValue.maybeWhen(
          data: (data) {
            if (data != null) {
              ref.read(homeControllerProvider.notifier).getNotesList();
              Navigator.of(context).pop();
              showSuccessSnackbar(context, "Success Update Note");
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
            child: Form(
              onChanged: controller.validateForm,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BottomSheetHolder(),
                  Gap.h20,
                  Text(
                    'Update Note',
                    style: TypographyApp.headlines1.bold,
                    textAlign: TextAlign.start,
                  ),
                  Gap.h20,
                  InputFormWidget(
                    controller: controller.titleController,
                    hintText: detailNote.title.toString(),
                    initialValue: detailNote.title.toString(),
                    validator: controller.validateTitle,
                  ),
                  Gap.h20,
                  InputFormWidget(
                    controller: controller.descController,
                    hintText: detailNote.desc.toString(),
                    initialValue: detailNote.desc.toString(),
                    validator: controller.validateDesc,
                    maxLines: 4,
                  ),
                  Gap.h40,
                  ButtonWidget.primary(
                    text: 'Update',
                    onTap: () {
                      controller.updateNote(
                          noteId: detailNote.noteId.toString());
                    },
                    isLoading: state.isLoading,
                    isEnabled: state.isValid,
                  ),
                  Gap.h20,
                  state.updateNoteValue.maybeWhen(
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
      ),
    );
  }
}
// / class UpdatePage extends ConsumerStatefulWidget {
//   final String noteId;
//   const UpdatePage({super.key, required this.noteId});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _UpdatePageState();
// }

// class _UpdatePageState extends ConsumerState<UpdatePage> {
//   UpdateController get controller =>
//       ref.read(updateControllerProvider.notifier);
//   UpdateState get state => ref.watch(updateControllerProvider);

//   @override
//   void initState() {
//     safeRebuild(() {
//       controller.getNoteDetail(noteId: widget.noteId);
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final value = state.noteDetailValue.value;

//   }
// }
