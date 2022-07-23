import 'package:hive/hive.dart';
import 'package:notes/data/model/notes_model.dart';

abstract class LocalDataSource {
  Future<List<NotesModel>> getNote();
  Future<void> addNote(NotesModel notes);
  Future<void> deleteNote(String title);
  Future<void> updateNote(NotesModel notes);
  Future<List<NotesModel>> getHistory();
  Future<void> addHistory(NotesModel notes);
  Future<void> deleteHistory(String content);
}

class LocalDataSourceImpl implements LocalDataSource {
  final box = Hive.box('NoteApp');
  final historybox = Hive.box('NoteHistory');

  @override
  Future<void> addNote(NotesModel notes) async {
    await box.put(notes.title, notes);
  }

  @override
  Future<void> deleteNote(String title) async {
    await box.delete(title);
  }

  @override
  Future<List<NotesModel>> getNote() async {
    var boxList = box.values.toList();
 
    final convertedTable = boxList.map((e) {
      return e as NotesModel;
    }).toList();
    return convertedTable;
  }

  @override
  Future<void> updateNote(NotesModel notes) async {
    await box.put(notes.title, notes);
  }

//-------------------------------------------------

  @override
  Future<void> addHistory(NotesModel notes) async {
    await historybox.put(notes.content, notes);
  }

  @override
  Future<List<NotesModel>> getHistory() async {
    var historyList = historybox.values.toList();

    final historyTable = historyList.map((e) {
      return e as NotesModel;
    }).toList();
    return historyTable;
  }

  @override
  Future<void> deleteHistory(String content) async {
    await historybox.delete(content);
  }
}
