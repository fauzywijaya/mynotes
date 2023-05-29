// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RequestLogin {
  final String username;
  final String password;
  RequestLogin({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory RequestLogin.fromMap(Map<String, dynamic> map) {
    return RequestLogin(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestLogin.fromJson(String source) =>
      RequestLogin.fromMap(json.decode(source) as Map<String, dynamic>);
}
