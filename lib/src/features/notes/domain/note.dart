import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Note {
  final String? noteId;
  final String? title;
  final String? desc;
  Note({
    this.noteId,
    this.title,
    this.desc,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noteId': noteId,
      'title': title,
      'desc': desc,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      noteId: map['noteId'] != null ? map['noteId'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);
}
