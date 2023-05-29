// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/exceptions/network_exceptions.dart';
import 'package:notes/src/features/data.dart';
import 'package:notes/src/services/services.dart';

class HomeRepository {
  final DioClient _dioClient;
  HomeRepository(
    this._dioClient,
  );

  Future<Result<HomeListResponse>> getRestaurantList() async {
    try {
      final response = await _dioClient.get(Endpoints.reqres);
      return Result.success(HomeListResponse.fromJson(response));
    } catch (e, stacktrace) {
      return Result.failure(
        NetworkExceptions.getDioExceptions(e),
        stacktrace,
      );
    }
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository(ref.read(dioClientProvider));
});
