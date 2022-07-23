import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:notes/domain/entity/notes_entity.dart';
import 'package:notes/presentation/cubit/cubit/note_cubit.dart';
import '../widgets/constructor_widget/custom_quicksand.dart';
import '../widgets/constructor_widget/custom_text_field.dart';

class UpdateNoteScreen extends StatefulWidget {
  final NotesEntity notes;
  const UpdateNoteScreen({Key? key, required this.notes}) : super(key: key);

  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {
  String date = DateFormat('dd MMM yyyy, KK:mm a').format(DateTime.now());
  final title = TextEditingController();
  final content = TextEditingController();

  @override
  void initState() {
    date = widget.notes.dateCreated;
    title.text = widget.notes.title;
    content.text = widget.notes.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final history = NotesEntity(
        title: title.text, content: content.text, dateCreated: date);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'Update Notes',
                fontWeight: FontWeight.bold,
              ),
              IconButton(
                  onPressed: () {
                    final updateNote = NotesEntity(
                      dateCreated: date,
                      title: title.text,
                      content: content.text,
                    );
                    context.read<NoteCubit>().addHistory(history);
                    context.read<NoteCubit>().updNote(updateNote);
                    context.read<NoteCubit>().getHistory();

                    Navigator.pop(context, true);
                  },
                  icon: const Icon(Icons.arrow_circle_up_outlined))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    date,
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber.shade700,
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CustomTextFormField(
                    controller: title,
                    readonly: true,
                    labelText: 'Title',
                    fontSize: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CustomTextField(
                    controller: content,
                    labelText: 'Start Typing',
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
