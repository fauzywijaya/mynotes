// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeService {
  final Ref ref;
  HomeService({
    required this.ref,
  });
}

final homeServiceProvider = Provider<HomeService>((ref) {
  return HomeService(
    ref: ref,
  );
});
