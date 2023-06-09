import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PostNote {
  final String? noteId;
  final String title;
  final String body;
  PostNote({
    this.noteId,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noteId': noteId,
      'title': title,
      'body': body,
    };
  }

  factory PostNote.fromMap(Map<String, dynamic> map) {
    return PostNote(
      noteId: map['noteId'] != null ? map['noteId'] as String : null,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostNote.fromJson(String source) =>
      PostNote.fromMap(json.decode(source) as Map<String, dynamic>);
}
