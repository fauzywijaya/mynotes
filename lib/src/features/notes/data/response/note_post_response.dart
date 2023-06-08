import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotePostResponse {
  final String noteId;
  NotePostResponse({
    required this.noteId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noteId': noteId,
    };
  }

  factory NotePostResponse.fromMap(Map<String, dynamic> map) {
    return NotePostResponse(
      noteId: map['noteId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotePostResponse.fromJson(String source) =>
      NotePostResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
