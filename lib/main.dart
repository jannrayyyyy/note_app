import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/data/model/notes_model.dart';
import 'package:notes/presentation/cubit/cubit/note_cubit.dart';
import 'package:notes/presentation/screens/home_screen.dart';
import 'dependency_injection.dart' as di;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final path = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(path.path);
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox('NoteApp');
  await Hive.openBox('NoteHistory');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<NoteCubit>(
        create: (context) => sl<NoteCubit>()..getNote(),
        child: const HomeScreen(),
      ),
    );
  }
}
