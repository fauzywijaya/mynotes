import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/application.dart';
import 'package:notes/src/features/domain.dart';

class AddController extends StateNotifier<AsyncValue<void>> {
  AddController({required this.addService})
      : super(const AsyncData<void>(null));

  final AddService addService;

  String title = '';
  String description = '';

  void titleChange(String? value) {
    title = value ?? '';
  }

  void descriptionChange(String? value) {
    description = value ?? '';
  }

  Future<void> postReview() async {
    state = const AsyncValue.loading();
    final addPost = AddPost(
      title: title,
      desc: description,
    );
    final result = await addService.postAdd(addPost: addPost);
    result.when(
      success: (data) => state = AsyncValue.data(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final addControllerProvider =
    StateNotifierProvider.autoDispose<AddController, AsyncValue<void>>(
        (ref) => AddController(addService: ref.watch(addServiceProvider)));
