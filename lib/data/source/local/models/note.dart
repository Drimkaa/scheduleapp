

import 'package:hive/hive.dart';

import 'date.dart';

part 'note.g.dart';

@HiveType(typeId: 5)
class NoteHiveModel extends HiveObject {
  static const String boxKey = 'note';

  @HiveField(0)
  late  int id;

  @HiveField(1)
  late  int lessonId;

  @HiveField(2)
  late String text;

  @HiveField(3)
  late DateHiveModel date;

}