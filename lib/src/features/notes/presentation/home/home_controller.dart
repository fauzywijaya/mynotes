import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/presentation.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState());
}

final homeControllerProvider = Provider<HomeController>((ref) {
  return HomeController();
});
