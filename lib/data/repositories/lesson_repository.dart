
import 'package:scheduleapp/data/entities/lesson_entity.dart';

abstract class LessonRepository {
  const LessonRepository();

  Future<List<Lesson>> getAllLessons();

  Future<Lesson?> getLesson({required int id});
}