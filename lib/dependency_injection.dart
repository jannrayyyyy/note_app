import 'package:get_it/get_it.dart';
import 'package:notes/data/repository/repo_implementation.dart';
import 'package:notes/domain/usecase/add_history.dart';
import 'package:notes/domain/usecase/delete_history.dart';
import 'package:notes/domain/usecase/get_history.dart';
import 'package:notes/domain/usecase/update_notes.dart';
import 'package:notes/presentation/cubit/cubit/note_cubit.dart';

import 'data/datasource/local_datasource.dart';
import 'domain/repository/repository.dart';
import 'domain/usecase/add_notes.dart';
import 'domain/usecase/delete_notes.dart';
import 'domain/usecase/get_notes.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => NoteCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerLazySingleton(() => GetNote(repo: sl()));
  sl.registerLazySingleton(() => AddNote(repo: sl()));
  sl.registerLazySingleton(() => DeleteNote(repo: sl()));
  sl.registerLazySingleton(() => UpdateNote(repo: sl()));
  sl.registerLazySingleton(() => AddHistory(repo: sl()));
  sl.registerLazySingleton(() => GetHistory(repo: sl()));
  sl.registerLazySingleton(() => DeleteHistory(repo: sl()));
  sl.registerLazySingleton<Repository>(() => RepoImplementation(sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}
