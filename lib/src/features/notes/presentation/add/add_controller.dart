import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/presentation.dart';

class AddController extends StateNotifier<AddState> {
  AddController() : super(AddState());
}

final addControllerProvider = Provider<AddController>((ref) {
  return AddController();
});
