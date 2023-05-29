// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/services/services.dart';

class HomeRepository {
  final DioClient _dioClient;
  HomeRepository(
    this._dioClient,
  );
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository(ref.read(dioClientProvider));
});
