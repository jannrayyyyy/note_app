import 'package:notes/domain/entity/notes_entity.dart';

abstract class Repository {
  Future<List<NotesEntity>> getNotes();
  Future<void> addNotes(NotesEntity notes);
  Future<void> deleteNotes(String title);
  Future<void> updateNote(NotesEntity notes);
  Future<List<NotesEntity>> getHistory();
  Future<void> addHistory(NotesEntity notes);
  Future<void> deleteHistory(String content);
}
