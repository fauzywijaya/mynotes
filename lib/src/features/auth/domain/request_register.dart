import 'dart:convert';

class RequestRegister {
  final String username;
  final String password;
  final String fullname;
  RequestRegister({
    required this.username,
    required this.password,
    required this.fullname,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'fullname': fullname,
    };
  }

  factory RequestRegister.fromMap(Map<String, dynamic> map) {
    return RequestRegister(
      username: map['username'] as String,
      password: map['password'] as String,
      fullname: map['fullname'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestRegister.fromJson(String source) =>
      RequestRegister.fromMap(json.decode(source) as Map<String, dynamic>);
}
