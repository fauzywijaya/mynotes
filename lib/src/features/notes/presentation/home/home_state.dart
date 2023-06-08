// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:notes/src/features/notes/domain/note_list.dart';

class HomeState {
  final AsyncValue<NoteList?> notesValue;
  final NoteList? noteList;

  const HomeState({
    this.notesValue = const AsyncValue.loading(),
    this.noteList,
  });

  HomeState copyWith({
    AsyncValue<NoteList?>? notesValue,
    NoteList? noteList,
  }) {
    return HomeState(
      notesValue: notesValue ?? this.notesValue,
      noteList: noteList ?? this.noteList,
    );
  }
}
