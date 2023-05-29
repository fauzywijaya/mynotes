import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/presentation.dart';

class UpdateController extends StateNotifier<UpdateState> {
  UpdateController() : super(UpdateState());
}

final updateControllerProvider =
    StateNotifierProvider.autoDispose<UpdateController, AsyncValue<void>>(
        (ref) => UpdateController());
