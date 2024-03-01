import 'package:hive/hive.dart';


part 'lesson_time.g.dart';

@HiveType(typeId: 3)
class LessonTimeHiveModel extends HiveObject {
  static const String boxKey = 'lessonTime';


  @HiveField(0)
  late String start;

  @HiveField(1)
  late String end;

  @HiveField(2)
  String? label;

}