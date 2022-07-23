// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:notes/domain/entity/notes_entity.dart';
import 'package:notes/domain/repository/repository.dart';

class GetNote {
  final Repository repo;
  GetNote({required this.repo});
  Future<List<NotesEntity>> call() async {
    return repo.getNotes();
  }
}
