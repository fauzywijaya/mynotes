// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Home extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  const Home({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  })  : id = id ?? 0,
        email = email ?? '',
        firstName = firstName ?? '',
        lastName = lastName ?? '',
        avatar = avatar ?? '';

  @override
  List<Object> get props {
    return [
      id,
      email,
      firstName,
      lastName,
      avatar,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
    };
  }

  factory Home.fromMap(Map<String, dynamic> map) {
    return Home(
      id: map['id'] as int,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Home.fromJson(String source) =>
      Home.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
