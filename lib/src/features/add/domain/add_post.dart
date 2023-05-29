import 'dart:convert';

class AddPost {
  final String title;
  final String desc;

  AddPost({
    String? title,
    String? desc,
  })  : title = title ?? '',
        desc = desc ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'desc': desc,
    };
  }

  factory AddPost.fromMap(Map<String, dynamic> map) {
    return AddPost(
      title: map['title'] as String,
      desc: map['desc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddPost.fromJson(String source) =>
      AddPost.fromMap(json.decode(source) as Map<String, dynamic>);
}
