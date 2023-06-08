import 'package:notes/src/features/data.dart';
import 'package:notes/src/features/notes/domain/note.dart';
import 'package:notes/src/features/notes/domain/note_list.dart';

class NoteMapper {
  static NoteList mapToNoteList(NoteListResponse response) {
    return NoteList(
      notes: response.notes
          .map((item) => Note(
                desc: item.body,
                noteId: item.id,
                title: item.title,
              ))
          .toList(),
    );
  }

  static Note mapToNote(NoteResponse response) {
    return Note(
      desc: response.body,
      noteId: response.id,
      title: response.title,
    );
  }
}
