import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/notes/application/note_services.dart';
import 'package:notes/src/features/notes/domain/add_notes.dart';
import 'package:notes/src/features/presentation.dart';
import 'package:notes/src/shared/extensions/dynamic.dart';

class UpdateController extends StateNotifier<UpdateState> {
  final NoteService _noteService;
  UpdateController(this._noteService) : super(UpdateState());

  final titleController = TextEditingController();
  final descController = TextEditingController();

  Future<void> getNoteDetail({required String noteId}) async {
    final result = await _noteService.getDetailNote(noteId: noteId);
    result.when(success: (data) {
      state = state.copyWith(noteDetailValue: AsyncData(data));
    }, failure: (error, stackTrace) {
      state = state.copyWith(
        noteDetailValue: AsyncError(error, stackTrace),
      );
    });
  }

  Future<void> updateNote({required String noteId}) async {
    state = state.copyWith(updateNoteValue: const AsyncLoading());
    final updateNote = AddNote(
      title: titleController.text,
      body: descController.text,
    );

    final result = await _noteService.updateNotes(updateNote, noteId: noteId);
    result.when(success: (data) {
      state = state.copyWith(updateNoteValue: AsyncData(data));
    }, failure: (error, stackTrace) {
      state = state.copyWith(
        updateNoteValue: AsyncError(error, stackTrace),
      );
    });
  }

  void validateForm() {
    final isValid = validateTitle(titleController.text).isNull() &&
        validateDesc(descController.text).isNull();
    state = state.copyWith(isValid: isValid);
  }

  String? validateTitle(String? value) {
    if (value.isNullOrEmpty()) {
      return 'Title cannot be empty';
    }
    return null;
  }

  String? validateDesc(String? value) {
    if (value.isNullOrEmpty()) {
      return 'Description cannot be empty';
    }
    return null;
  }
}

final updateControllerProvider =
    StateNotifierProvider.autoDispose<UpdateController, UpdateState>((ref) {
  final noteService = ref.watch(noteServiceProvider);
  return UpdateController(noteService);
});
