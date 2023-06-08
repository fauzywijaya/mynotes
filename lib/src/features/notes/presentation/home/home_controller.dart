// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:notes/src/features/notes/application/note_services.dart';
import 'package:notes/src/features/notes/presentation/home/home_state.dart';
import 'package:notes/src/services/local/hive_service.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(this._hiveService, this._noteService)
      : super(const HomeState()) {
    getNotesList();
  }

  final NoteService _noteService;
  final HiveService _hiveService;

  Future<void> getNotesList() async {
    state = state.copyWith(notesValue: const AsyncLoading());
    final result = await _noteService.getNotesList();
    result.when(
      success: (data) {
        state = state.copyWith(noteList: data, notesValue: AsyncData(data));
      },
      failure: (error, stacktrace) {
        state = state.copyWith(notesValue: AsyncError(error, stacktrace));
      },
    );
  }

  Future<void> deleteNote({required String noteId}) async {
    final result = await _noteService.deleteNotes(noteId: noteId);
    result.when(
      success: (data) {
        getNotesList();
      },
      failure: (error, stacktrace) {
        state = state.copyWith(notesValue: AsyncError(error, stacktrace));
      },
    );
  }

  void logout() {
    return _hiveService.logout();
  }
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  final hiveService = ref.read(hiveServiceProvider);
  final noteService = ref.read(noteServiceProvider);
  return HomeController(hiveService, noteService);
});
