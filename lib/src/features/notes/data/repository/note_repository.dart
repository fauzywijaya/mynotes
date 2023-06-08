// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/exceptions/network_exceptions.dart';
import 'package:notes/src/features/data.dart';
import 'package:notes/src/features/notes/domain/add_notes.dart';
import 'package:notes/src/services/services.dart';

class NoteRepository {
  final DioClient _dioClient;
  NoteRepository(
    this._dioClient,
  );

  Future<Result<NoteListResponse>> getNotes() async {
    try {
      final response = await _dioClient.get(Endpoints.notes);
      return Result.success(NoteListResponse.fromJson(response['data']));
    } catch (e, stacktrace) {
      return Result.failure(
        NetworkExceptions.getDioExceptions(e),
        stacktrace,
      );
    }
  }

  Future<Result<NoteResponse>> getDetailNotes(String noteId) async {
    try {
      final response = await _dioClient.get(
        Endpoints.notesDetail.replaceAll('{id}', noteId),
      );
      return Result.success(NoteResponse.fromJson(response['data']));
    } catch (e, stacktrace) {
      return Result.failure(
        NetworkExceptions.getDioExceptions(e),
        stacktrace,
      );
    }
  }

  Future<Result<void>> postNotes(AddNote postNote) async {
    try {
      await _dioClient.post(Endpoints.notes, data: postNote.toJson());
      return const Result.success(null);
    } catch (e, stacktrace) {
      return Result.failure(
        NetworkExceptions.getDioExceptions(e),
        stacktrace,
      );
    }
  }

  Future<Result<void>> updateNotes(AddNote updateNote,
      {required String noteId}) async {
    try {
      await _dioClient.put(
        Endpoints.notesDetail.replaceAll('{id}', noteId),
        data: updateNote.toJson(),
      );
      return const Result.success(null);
    } catch (e, stacktrace) {
      return Result.failure(
        NetworkExceptions.getDioExceptions(e),
        stacktrace,
      );
    }
  }

  Future<Result<void>> deleteNotes({required String noteId}) async {
    try {
      await _dioClient.delete(
        Endpoints.notesDetail.replaceAll('{id}', noteId),
      );
      return const Result.success(null);
    } catch (e, stacktrace) {
      return Result.failure(
        NetworkExceptions.getDioExceptions(e),
        stacktrace,
      );
    }
  }
}

final noteRepositoryProvider = Provider<NoteRepository>((ref) {
  return NoteRepository(ref.read(dioClientProvider));
});
