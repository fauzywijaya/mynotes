// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:notes/src/features/notes/domain/note.dart';

class NoteList {
  final List<Note>? notes;
  NoteList({
    List<Note>? notes,
  }) : notes = notes ?? [];

  Map<String, dynamic> toMap() {
    return {
      'notes': notes?.map((x) => x.toMap()).toList(),
    };
  }

  factory NoteList.fromMap(Map<String, dynamic> map) {
    return NoteList(
      notes: List<Note>.from(
        (map['notes'] as List<int>).map<Note>(
          (x) => Note.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteList.fromJson(String source) =>
      NoteList.fromMap(json.decode(source) as Map<String, dynamic>);
}
