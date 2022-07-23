// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'note_cubit.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {}

class Loading extends NoteState {}

class Loaded extends NoteState {
  final List<NotesEntity> note;
  const Loaded({required this.note});
}

class Empty extends NoteState {}
