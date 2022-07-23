// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:notes/domain/entity/notes_entity.dart';
import 'package:notes/domain/repository/repository.dart';

class AddNote {
  final Repository repo;
  AddNote({required this.repo});
  Future<void> call(NotesEntity notes) async {
    await repo.addNotes(notes);
  }
}
