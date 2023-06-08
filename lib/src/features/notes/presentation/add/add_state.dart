// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddState {
  final AsyncValue<String?> postNoteValue;
  final bool isValid;

  AddState({
    this.postNoteValue = const AsyncData(null),
    this.isValid = false,
  });

  bool get isLoading => postNoteValue is AsyncLoading;

  AddState copyWith({
    AsyncValue<String?>? postNoteValue,
    bool? isValid,
  }) {
    return AddState(
      postNoteValue: postNoteValue ?? this.postNoteValue,
      isValid: isValid ?? this.isValid,
    );
  }
}
