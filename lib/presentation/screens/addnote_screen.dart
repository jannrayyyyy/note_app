import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:notes/domain/entity/notes_entity.dart';
import 'package:notes/presentation/cubit/cubit/note_cubit.dart';
import '../widgets/constructor_widget/custom_quicksand.dart';
import '../widgets/constructor_widget/custom_text_field.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  String date = DateFormat('dd MMM yyyy, KK:mm a').format(DateTime.now());
  final title = TextEditingController();
  final content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'New Notes',
                fontWeight: FontWeight.bold,
              ),
              IconButton(
                  onPressed: () {
                    final newNote = NotesEntity(
                      dateCreated: date,
                      title: title.text,
                      content: content.text,
                    );

                    if (title.text.isNotEmpty) {
                      context.read<NoteCubit>().addNote(newNote);
                      context.read<NoteCubit>().addHistory(newNote);
                      Navigator.pop(context, true);
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              title: const Center(
                                  child: CustomText(
                                text: 'Field is Empty',
                                fontWeight: FontWeight.bold,
                              )),
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  child: Center(
                                      child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const CustomText(
                                      text: 'Add Something!',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                )
                              ],
                            );
                          });
                    }
                  },
                  icon: const Icon(Icons.check))
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
                    readonly: false,
                    labelText: 'Title',
                    fontSize: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CustomTextField(
                    controller: content,
                    readOnly: false,
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
