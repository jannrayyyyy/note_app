// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:notes/domain/entity/notes_entity.dart';
import 'package:notes/domain/usecase/add_history.dart';
import 'package:notes/domain/usecase/add_notes.dart';
import 'package:notes/domain/usecase/delete_history.dart';
import 'package:notes/domain/usecase/delete_notes.dart';
import 'package:notes/domain/usecase/get_history.dart';
import 'package:notes/domain/usecase/get_notes.dart';
import 'package:notes/domain/usecase/update_notes.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final GetNote _get;
  final AddNote _add;
  final DeleteNote _del;
  final UpdateNote _update;
  final AddHistory _addHistory;
  final GetHistory _getHistory;
  final DeleteHistory _delHistory;
  NoteCubit(
    this._get,
    this._add,
    this._del,
    this._update,
    this._addHistory,
    this._getHistory,
    this._delHistory,
  ) : super(NoteInitial());

  void getNote() async {
    emit(Loading());
    final notes = await _get();

    if (notes.isEmpty) {
      emit(Empty());
    } else {
      emit(Loaded(note: notes));
    }
  }

  void addNote(NotesEntity notes) async {
    await _add(notes);
  }

  void delNote(String title) async {
    await _del(title);
  }

  void updNote(NotesEntity notes) async {
    await _update(notes);
  }

  void addHistory(NotesEntity notes) async {
    await _addHistory(notes);
  }

  void getHistory() async {
    emit(Loading());

    final notes = await _getHistory();

    if (notes.isEmpty) {
      emit(Empty());
    } else {
      emit(Loaded(note: notes));
    }
  }

  void delHistory(String content) async {
    await _delHistory(content);
  }
}
