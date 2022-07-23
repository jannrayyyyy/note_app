import 'package:hive/hive.dart';
import 'package:notes/domain/entity/notes_entity.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 0)
class NotesModel extends NotesEntity {
  const NotesModel({
    @HiveField(0) required super.dateCreated,
    @HiveField(1) required super.content,
    @HiveField(2) required super.title,
  });

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      title: map['title'],
      content: map['notes'],
      dateCreated: map['date'],
    );
  }

  factory NotesModel.fromEntity(NotesEntity note) {
    return NotesModel(
      title: note.title,
      content: note.content,
      dateCreated: note.dateCreated,
    );
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'content': content,
        'dateCreated': dateCreated,
      };
}
