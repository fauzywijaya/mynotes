// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:notes/src/features/notes/application/note_services.dart';
import 'package:notes/src/features/notes/domain/add_notes.dart';
import 'package:notes/src/features/presentation.dart';
import 'package:notes/src/shared/extensions/dynamic.dart';

class AddController extends StateNotifier<AddState> {
  final NoteService _noteService;
  AddController(
    this._noteService,
  ) : super(AddState());

  final titleController = TextEditingController();
  final descController = TextEditingController();

  Future<void> postNotes() async {
    state = state.copyWith(postNoteValue: const AsyncLoading());

    final postNote = AddNote(
      title: titleController.text,
      body: descController.text,
    );

    final result = await _noteService.postNote(
      postNote,
    );

    result.when(
      success: (data) {
        state = state.copyWith(
          postNoteValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          postNoteValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void validateForm() {
    state = state.copyWith(
        isAddValid: validateTitleText(titleController.text).isNull() &&
            validateDescText(descController.text).isNull());
  }

  String? validateTitleText(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    }
    return null;
  }

  String? validateDescText(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    }
    return null;
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }
}

final addControllerProvider =
    StateNotifierProvider.autoDispose<AddController, AddState>((ref) {
  final noteService = ref.read(noteServiceProvider);
  return AddController(noteService);
});
