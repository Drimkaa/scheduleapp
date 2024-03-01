
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/core/constants/lessons.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';
import 'package:scheduleapp/data/repositories/lesson_repository.dart';
import 'package:scheduleapp/data/source/local/hive_source.dart';
import 'package:scheduleapp/data/source/local/models/date.dart';
import 'package:scheduleapp/data/source/local/models/lesson.dart';
import 'package:scheduleapp/data/source/local/models/lesson_time.dart';
import 'package:scheduleapp/data/source/local/models/week.dart';
import 'package:scheduleapp/data/source/mapper/hive_to_entity.dart';

class LessonRepositoryImpl extends LessonRepository {

  final LocalDataSource _localDataSource;

  const LessonRepositoryImpl({
    required LocalDataSource localDataSource,
  })  :
        _localDataSource = localDataSource;

  @override
  Future<List<Lesson>> getAllLessons() async {
    final hasCachedData = await _localDataSource.hasLessonsData();

    if (!hasCachedData) {
      List<Lesson> lessonsTemp = lessonsList;
      final Iterable<LessonHiveModel> lessonHiveModels = lessonsTemp.map((e) =>
      LessonHiveModel()..id=e.id.trim()
          ..subjectType=e.subjectType.pos
          ..subject=e.subject.trim()
          ..subgroup=e.subgroup
          ..lessonType=e.lessonType.pos
          ..teacher=e.teacher
        ..classroom = e.classroom
          ..time=(LessonTimeHiveModel()..start=e.time.start..end=e.time.end..label=e.time.label)
          ..date = (DateHiveModel()..day=e.date.day.pos ..type=(WeekHiveModel()..weeks=e.date.type.weeks))
      );

      await _localDataSource.saveLessons(lessonHiveModels);
    }

    final lessonHiveModels = await _localDataSource.getAllLessons();

    final returned = lessonHiveModels.map((e) => e.toEntity()).toList();

    return returned;
  }

  @override
  Future<Lesson?> getLesson({required int id}) {
    // TODO: implement getLesson
    throw UnimplementedError();
  }

}