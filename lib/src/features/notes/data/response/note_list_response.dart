import 'dart:convert';

import 'package:notes/src/features/data.dart';

class NoteListResponse {
  final List<NoteResponse> notes;

  NoteListResponse({
    required this.notes,
  });

  factory NoteListResponse.fromRawJson(String str) =>
      NoteListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NoteListResponse.fromJson(Map<String, dynamic> json) =>
      NoteListResponse(
        notes: List<NoteResponse>.from(
            json["notes"].map((x) => NoteResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
      };
}
