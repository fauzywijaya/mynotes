import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/data.dart';
import 'package:notes/src/features/domain.dart';
import 'package:notes/src/services/services.dart';

class UpdateService {
  final Ref ref;

  UpdateService({
    required this.ref,
  });

  Future<Result<void>> postUpdate({required UpdatePost updatePost}) async {
    return ref
        .read(updateRepositoryProvider)
        .postUpdate(updatePost: updatePost);
  }
}

final updateServiceProvider = Provider<UpdateService>((ref) {
  return UpdateService(
    ref: ref,
  );
});
