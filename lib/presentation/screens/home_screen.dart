import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentation/cubit/cubit/note_cubit.dart';
import 'package:notes/presentation/screens/addnote_screen.dart';
import 'package:notes/presentation/screens/history_screen.dart';
import 'package:notes/presentation/screens/updatenote_screen.dart';
import 'package:notes/presentation/widgets/constructor_widget/custom_quicksand.dart';
import 'package:notes/presentation/widgets/screen_display/note_display.dart';

import '../../dependency_injection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText(
              text: 'Notes',
              fontWeight: FontWeight.bold,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () async {
                      bool isRefreshed = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => BlocProvider<NoteCubit>(
                                create: (context) => sl<NoteCubit>(),
                                child: const HistoryScreen(),
                              )),
                        ),
                      );
                      if (isRefreshed) {
                        context.read<NoteCubit>().getNote();
                      }
                    },
                    icon: const Icon(Icons.history)),
                IconButton(
                    onPressed: () async {
                      bool isRefreshed = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider<NoteCubit>(
                            create: (context) => sl<NoteCubit>(),
                            child: const AddNoteScreen(),
                          ),
                        ),
                      );
                      if (isRefreshed) {
                        context.read<NoteCubit>().getNote();
                      }
                    },
                    icon: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is Empty) {
            return const Center(child: Text('Empty'));
          } else if (state is Loaded) {
            return ListView(
              children: state.note.map((e) {
                return GestureDetector(
                    onTap: () async {
                      bool isRefreshed = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider<NoteCubit>(
                            create: (context) => sl<NoteCubit>(),
                            child: UpdateNoteScreen(notes: e),
                          ),
                        ),
                      );
                      if (isRefreshed) {
                        context.read<NoteCubit>().getNote();
                      }
                    },
                    child: NoteDisplay(notes: e));
              }).toList(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
