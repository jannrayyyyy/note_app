import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentation/widgets/constructor_widget/custom_quicksand.dart';
import 'package:notes/presentation/widgets/screen_display/note_display.dart';

import '../../dependency_injection.dart';
import '../cubit/cubit/note_cubit.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NoteCubit>(
      create: (context) => sl<NoteCubit>()..getHistory(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const CustomText(
            text: 'Note History',
            fontWeight: FontWeight.bold,
          ),
        ),
        body: BlocBuilder<NoteCubit, NoteState>(
          builder: (context, state) {
            if (state is Empty) {
              return const Center(child: Text('Empty'));
            } else if (state is Loaded) {
              return ListView(
                children: state.note.map((e) {
                  return NoteDisplay(notes: e);
                }).toList(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
