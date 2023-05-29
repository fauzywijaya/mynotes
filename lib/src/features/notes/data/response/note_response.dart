import 'dart:convert';

class NoteResponse {
  final String id;
  final String title;
  final String body;
  final String tags;
  final DateTime createdAt;
  final DateTime updatedAt;

  NoteResponse({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteResponse.fromRawJson(String str) =>
      NoteResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NoteResponse.fromJson(Map<String, dynamic> json) => NoteResponse(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        tags: json["tags"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "tags": tags,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
