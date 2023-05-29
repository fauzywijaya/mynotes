import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/add/data/repositories/add_repositories.dart';
import 'package:notes/src/features/domain.dart';
import 'package:notes/src/services/services.dart';

class AddService {
  final Ref ref;

  AddService({
    required this.ref,
  });

  Future<Result<void>> postAdd({required AddPost addPost}) async {
    return ref.read(addRepositoryProvider).postAdd(addPost: addPost);
  }
}

final addServiceProvider = Provider<AddService>((ref) {
  return AddService(
    ref: ref,
  );
});
