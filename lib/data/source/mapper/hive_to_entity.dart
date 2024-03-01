

import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/data/entities/date_entity.dart';
import 'package:scheduleapp/data/entities/group/group_entity.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';
import 'package:scheduleapp/data/entities/lesson_time_entity.dart';
import 'package:scheduleapp/data/entities/note_entity.dart';
import 'package:scheduleapp/data/entities/week_entity.dart';
import 'package:scheduleapp/data/source/local/models/date.dart';
import 'package:scheduleapp/data/source/local/models/group/group.dart';
import 'package:scheduleapp/data/source/local/models/lesson.dart';
import 'package:scheduleapp/data/source/local/models/lesson_time.dart';
import 'package:scheduleapp/data/source/local/models/note.dart';
import 'package:scheduleapp/data/source/local/models/week.dart';

extension DateHiveModelX on DateHiveModel {
  Date toEntity({List<DateHiveModel> list = const []}) => Date( day: Weekday.fromPos(day), type: type.toEntity());
}
extension WeekHiveModelX on WeekHiveModel {
  Week toEntity({List<WeekHiveModel> list = const []}) => Week(weeks: weeks);
}

extension LessonHiveModelX on LessonHiveModel {
  Lesson toEntity({List<LessonHiveModel> list = const []}) => Lesson(
     id: id,
      subject: subject,
      subjectType:SubjectType.fromPos(subjectType),
      teacher:teacher,
      lessonType:LessonType.fromPos(lessonType),
      time:time.toEntity(),
      classroom: classroom,
      date: date.toEntity(),
      subgroup:subgroup);
}

extension LessonTimeHiveModelX on LessonTimeHiveModel {
  LessonTime toEntity({List<DateHiveModel> list = const []}) => LessonTime(start: start, end: end,label: label??"",
  );
}
extension NoteHiveModelX on NoteHiveModel {
  Note toEntity({List<DateHiveModel> list = const []}) => Note(id: id, lessonId: lessonId, text: text, date: date.toEntity());
}

extension GroupHiveModelX on GroupHiveModel {
  Group toEntity({List<Group> list = const []}) => Group(group: group, subgroup: subgroup);
}

