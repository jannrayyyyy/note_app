// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class NotesEntity extends Equatable {
  final String title;
  final String content;
  final String dateCreated;
  const NotesEntity({
    required this.title,
    required this.content,
    required this.dateCreated,
  });

  @override
  List<Object?> get props => [];
}
