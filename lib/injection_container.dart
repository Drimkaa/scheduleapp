import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:scheduleapp/data/repositories/group_repository.dart';
import 'package:scheduleapp/data/repositories/lesson_repository.dart';
import 'package:scheduleapp/data/repositories/lesson_repository.default.dart';
import 'package:scheduleapp/data/repositories/postgres_repository.dart';
import 'package:scheduleapp/data/source/local/hive_source.dart';
import 'package:scheduleapp/data/usecase/get_weeks.dart';
import 'package:scheduleapp/presenter/bloc/edit/edit_bloc.dart';
import 'package:scheduleapp/presenter/bloc/right_menu/right_menu_bloc.dart';
import 'package:scheduleapp/presenter/bloc/week/week_bloc.dart';

import 'data/source/postgres/postgres_source.dart';
import 'data/usecase/get_suggestions.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  LocalDataSource loc = LocalDataSource();
  await loc.initialize();
  sl.registerSingleton<LocalDataSource>(loc);
  PostgresDataSource db = PostgresDataSource();
  await db.initialize();
  sl.registerSingleton<PostgresDataSource>(db);
  sl.registerSingleton<GetSuggestionsUseCase>(GetSuggestionsUseCase(PostgresRepositoryImpl(source: sl())));

  sl.registerSingleton<LessonRepository>(LessonRepositoryImpl(localDataSource: sl()));
  sl.registerSingleton<GroupRepository>(GroupRepositoryImpl(localDataSource: sl()));
  //UseCases - notes
  sl.registerSingleton<GetWeekDaysSchedule>(GetWeekDaysSchedule(lessonRepository: sl(), groupRepository: sl()));

  sl.registerFactory<RightMenuBloc>(() => RightMenuBloc());
  sl.registerFactory<EditBloc>(() => EditBloc());
  sl.registerFactory<WeekPageBloc>(() => WeekPageBloc(getWeekDaysSchedule: sl()));
}