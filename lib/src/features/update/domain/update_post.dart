// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpdatePost {
  final String id;
  final String title;
  final String desc;
  UpdatePost({
    String? title,
    String? desc,
    String? id,
  })  : id = id ?? '',
        title = title ?? '',
        desc = desc ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'desc': desc,
    };
  }

  factory UpdatePost.fromMap(Map<String, dynamic> map) {
    return UpdatePost(
      id: map['id'] as String,
      title: map['title'] as String,
      desc: map['desc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdatePost.fromJson(String source) =>
      UpdatePost.fromMap(json.decode(source) as Map<String, dynamic>);
}
