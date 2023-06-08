// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:notes/src/features/notes/domain/note.dart';

class UpdateState {
  final AsyncValue<String?> updateNoteValue;
  final AsyncValue<Note> noteDetailValue;
  final bool isValid;

  UpdateState({
    this.noteDetailValue = const AsyncLoading(),
    this.updateNoteValue = const AsyncData(null),
    this.isValid = false,
  });

  bool get isLoading => updateNoteValue is AsyncLoading;

  UpdateState copyWith({
    AsyncValue<String?>? updateNoteValue,
    AsyncValue<Note>? noteDetailValue,
    bool? isValid,
  }) {
    return UpdateState(
      updateNoteValue: updateNoteValue ?? this.updateNoteValue,
      noteDetailValue: noteDetailValue ?? this.noteDetailValue,
      isValid: isValid ?? this.isValid,
    );
  }
}
