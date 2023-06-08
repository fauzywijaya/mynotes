import 'package:notes/src/features/auth/data/response/login_response.dart';
import 'package:notes/src/features/domain.dart';

class AuthMapper {
  static UserLogin mapToUser(LoginResponse data) {
    return UserLogin(
        accessToken: data.accessToken ?? '',
        refreshToken: data.refreshToken ?? '');
  }
}
