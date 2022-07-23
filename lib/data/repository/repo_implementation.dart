import 'package:notes/data/datasource/local_datasource.dart';
import 'package:notes/data/model/notes_model.dart';
import 'package:notes/domain/entity/notes_entity.dart';
import 'package:notes/domain/repository/repository.dart';

class RepoImplementation implements Repository {
  final LocalDataSource local;
  RepoImplementation(this.local);
  @override
  Future<void> addNotes(NotesEntity note) async {
    await local.addNote(NotesModel.fromEntity(note));
  }

  @override
  Future<void> deleteNotes(String title) async {
    await local.deleteNote(title);
  }

  @override
  Future<List<NotesEntity>> getNotes() async {
    return local.getNote();
  }

  @override
  Future<void> updateNote(NotesEntity notes) async {
    await local.updateNote(NotesModel.fromEntity(notes));
  }

  @override
  Future<void> addHistory(NotesEntity notes) async {
    await local.addHistory(NotesModel.fromEntity(notes));
  }

  @override
  Future<List<NotesEntity>> getHistory() async {
    return local.getHistory();
  }

  @override
  Future<void> deleteHistory(String content) async {
    await local.deleteHistory(content);
  }
}
