import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/exceptions/network_exceptions.dart';
import 'package:notes/src/features/domain.dart';
import 'package:notes/src/services/services.dart';

class AddRepository {
  final DioClient _dioClient;

  AddRepository(this._dioClient);

  Future<Result<void>> postAdd({required AddPost addPost}) async {
    try {
      await _dioClient.post(
        Endpoints.addNotes,
        data: addPost.toJson(),
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

final addRepositoryProvider = Provider<AddRepository>((ref) {
  return AddRepository(ref.read(dioClientProvider));
});
