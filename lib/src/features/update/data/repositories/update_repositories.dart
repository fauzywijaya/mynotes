import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/exceptions/network_exceptions.dart';
import 'package:notes/src/features/domain.dart';
import 'package:notes/src/services/services.dart';

class UpdateRepository {
  final DioClient _dioClient;

  UpdateRepository(this._dioClient);

  Future<Result<void>> postUpdate({required UpdatePost updatePost}) async {
    try {
      await _dioClient.put(
        Endpoints.addNotes,
        data: updatePost.toJson(),
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

final updateRepositoryProvider = Provider<UpdateRepository>((ref) {
  return UpdateRepository(ref.read(dioClientProvider));
});
