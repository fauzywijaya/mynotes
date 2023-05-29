import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/domain.dart';
import 'package:notes/src/features/home/application/home_service.dart';

class HomeListController extends StateNotifier<AsyncValue<HomeList>> {
  HomeListController({required this.homeService})
      : super(AsyncData<HomeList>(HomeList()));

  final HomeService homeService;

  Future<void> getHomeList() async {
    state = const AsyncValue.loading();
    final result = await homeService.getHomeList();
    result.when(
      success: (data) => state = AsyncValue.data(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final homeListControllerProvider =
    StateNotifierProvider.autoDispose<HomeListController, AsyncValue<HomeList>>(
        (ref) =>
            HomeListController(homeService: ref.watch(homeServiceProvider)));
