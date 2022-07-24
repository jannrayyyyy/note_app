import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:notes/domain/entity/notes_entity.dart';
import '../widgets/constructor_widget/custom_quicksand.dart';
import '../widgets/constructor_widget/custom_text_field.dart';

class HistoryDetailScreen extends StatefulWidget {
  final NotesEntity notes;
  const HistoryDetailScreen({Key? key, required this.notes}) : super(key: key);

  @override
  State<HistoryDetailScreen> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
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
          title: const CustomText(
            text: 'Update Notes',
            fontWeight: FontWeight.bold,
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
                    readOnly: true,
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
