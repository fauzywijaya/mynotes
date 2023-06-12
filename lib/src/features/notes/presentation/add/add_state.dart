// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddState {
  final AsyncValue<String?> postNoteValue;
  final bool isAddValid;

  AddState({
    this.postNoteValue = const AsyncData(null),
    this.isAddValid = false,
  });

  bool get isLoading => postNoteValue is AsyncLoading;

  AddState copyWith({
    AsyncValue<String?>? postNoteValue,
    bool? isAddValid,
  }) {
    return AddState(
      postNoteValue: postNoteValue ?? this.postNoteValue,
      isAddValid: isAddValid ?? this.isAddValid,
    );
  }
}
