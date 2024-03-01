

import 'package:hive/hive.dart';
import 'lesson_time.dart';

import 'date.dart';

part 'lesson.g.dart';

@HiveType(typeId: 4)
class LessonHiveModel extends HiveObject {
  static const String boxKey = 'lesson';

  @HiveField(0)
  late String id;

  @HiveField(1)
  late String subject;

  @HiveField(2)
  late int subjectType;

  @HiveField(3)
  late String teacher;

  @HiveField(4)
  late int lessonType;

  @HiveField(5)
  late LessonTimeHiveModel time;



  @HiveField(6)
  late String classroom;

  @HiveField(7)
  late DateHiveModel date;

  @HiveField(8)
  late int subgroup;





}