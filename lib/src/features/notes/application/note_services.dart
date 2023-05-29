// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteService {
  final Ref ref;
  NoteService({
    required this.ref,
  });
}

final noteServiceProvider = Provider<NoteService>((ref) {
  return NoteService(
    ref: ref,
  );
});
