// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:notes/src/features/data.dart';
import 'package:notes/src/features/notes/application/note_mapper.dart';
import 'package:notes/src/features/notes/domain/add_notes.dart';
import 'package:notes/src/features/notes/domain/note.dart';
import 'package:notes/src/features/notes/domain/note_list.dart';
import 'package:notes/src/services/remote/remote.dart';

class NoteService {
  final NoteRepository _noteRepository;
  NoteService(
    this._noteRepository,
  );

  Future<Result<NoteList>> getNotesList() async {
    final result = await _noteRepository.getNotes();
    return result.when(
      success: (data) {
        final noteList = NoteMapper.mapToNoteList(data);
        return Result.success(noteList);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<Note>> getDetailNote({required String noteId}) async {
    final result = await _noteRepository.getDetailNotes(noteId);
    return result.when(
      success: (data) {
        final note = NoteMapper.mapToNote(data);
        return Result.success(note);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<String?>> postNote(AddNote postNote) async {
    final result = await _noteRepository.postNotes(postNote);
    return result.when(success: (data) {
      return const Result.success("Success");
    }, failure: (error, stackTrace) {
      return Result.failure(error, stackTrace);
    });
  }

  Future<Result<String?>> updateNotes(AddNote updateNote,
      {required String noteId}) async {
    final result =
        await _noteRepository.updateNotes(updateNote, noteId: noteId);
    return result.when(success: (data) {
      return const Result.success("Success");
    }, failure: (error, stackTrace) {
      return Result.failure(error, stackTrace);
    });
  }

  Future<Result<String?>> deleteNotes({required String noteId}) async {
    final result = await _noteRepository.deleteNotes(noteId: noteId);
    return result.when(success: (data) {
      return const Result.success("Success");
    }, failure: (error, stackTrace) {
      return Result.failure(error, stackTrace);
    });
  }
}

final noteServiceProvider = Provider<NoteService>((ref) {
  final noteRepository = ref.read(noteRepositoryProvider);
  return NoteService(noteRepository);
});
