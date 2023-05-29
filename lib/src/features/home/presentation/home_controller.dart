import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/domain.dart';
import 'package:notes/src/features/home/application/home_service.dart';

class HomeListController extends StateNotifier<AsyncValue<HomeList>> {
  HomeListController({required this.homeService})
      : super(AsyncData<HomeList>(HomeList()));

  final HomeService homeService;
}

final homeListControllerProvider =
    StateNotifierProvider.autoDispose<HomeListController, AsyncValue<HomeList>>(
        (ref) =>
            HomeListController(homeService: ref.watch(homeServiceProvider)));
