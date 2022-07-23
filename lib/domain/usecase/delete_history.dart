// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:notes/domain/repository/repository.dart';

class DeleteHistory {
  final Repository repo;
  DeleteHistory({required this.repo});
  Future<void> call(String content) async {
    await repo.deleteHistory(content);
  }
}
