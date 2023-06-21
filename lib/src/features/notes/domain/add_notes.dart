import 'dart:convert';

class AddNote {
  final String title;
  final String body;
  AddNote({
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
    };
  }

  factory AddNote.fromMap(Map<String, dynamic> map) {
    return AddNote(
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddNote.fromJson(String source) =>
      AddNote.fromMap(json.decode(source) as Map<String, dynamic>);
}
