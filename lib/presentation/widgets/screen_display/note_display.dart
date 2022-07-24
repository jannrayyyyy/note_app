import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/domain/entity/notes_entity.dart';
import 'package:notes/presentation/cubit/cubit/note_cubit.dart';
import 'package:notes/presentation/widgets/constructor_widget/custom_quicksand.dart';

class NoteDisplay extends StatefulWidget {
  final NotesEntity notes;
  const NoteDisplay({Key? key, required this.notes}) : super(key: key);

  @override
  State<NoteDisplay> createState() => _NoteDisplayState();
}

class _NoteDisplayState extends State<NoteDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: ListTile(
        title: CustomText(
          text: widget.notes.title,
          fontWeight: FontWeight.bold,
        ),
        subtitle: CustomText(
          text: widget.notes.content,
          maxLine: 1,
          overflow: TextOverflow.fade,
        ),
        trailing: IconButton(
            onPressed: () {
              context.read<NoteCubit>().delNote(widget.notes.title);
              context.read<NoteCubit>().delHistory(widget.notes.content);
              context.read<NoteCubit>().getNote();
            },
            icon: Icon(Icons.delete, color: Colors.red.shade300)),
      ),
    );
  }
}
