import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/application.dart';
import 'package:notes/src/features/domain.dart';

class UpdateController extends StateNotifier<AsyncValue<void>> {
  UpdateController({required this.updateService})
      : super(const AsyncData<void>(null));

  final UpdateService updateService;

  String title = '';
  String description = '';

  void titleChange(String? value) {
    title = value ?? '';
  }

  void descriptionChange(String? value) {
    description = value ?? '';
  }

  Future<void> postUpdate({required String id}) async {
    state = const AsyncValue.loading();
    final updatePost = UpdatePost(
      id: id,
      title: title,
      desc: description,
    );
    final result = await updateService.postUpdate(updatePost: updatePost);
    result.when(
      success: (data) => state = AsyncValue.data(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final updateControllerProvider =
    StateNotifierProvider.autoDispose<UpdateController, AsyncValue<void>>(
        (ref) =>
            UpdateController(updateService: ref.watch(updateServiceProvider)));
