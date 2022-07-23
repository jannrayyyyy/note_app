// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:notes/domain/repository/repository.dart';

class DeleteNote {
  final Repository repo;
  DeleteNote({required this.repo});
  Future<void> call(String title) async {
    await repo.deleteNotes(title);
  }
}
