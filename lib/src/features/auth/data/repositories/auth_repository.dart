// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/exceptions/network_exceptions.dart';
import 'package:notes/src/features/data.dart';
import 'package:notes/src/features/domain.dart';
import 'package:notes/src/services/services.dart';

class AuthRepository {
  final DioClient _dioClient;
  AuthRepository(
    this._dioClient,
  );

  Future<Result<RegisterResponse>> register(
      RequestRegister requestRegister) async {
    try {
      final response = await _dioClient.post(
        Endpoints.register,
        data: requestRegister.toJson(),
      );
      return Result.success(RegisterResponse.fromJson(response['data']));
    } catch (e, stacktrace) {
      return Result.failure(
        NetworkExceptions.getDioExceptions(e),
        stacktrace,
      );
    }
  }

  Future<Result<LoginResponse>> login(RequestLogin requestLogin) async {
    try {
      final response = await _dioClient.post(
        Endpoints.register,
        data: requestLogin.toJson(),
      );
      return Result.success(LoginResponse.fromJson(response['data']));
    } catch (e, stacktrace) {
      return Result.failure(
        NetworkExceptions.getDioExceptions(e),
        stacktrace,
      );
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return AuthRepository(dioClient);
});
