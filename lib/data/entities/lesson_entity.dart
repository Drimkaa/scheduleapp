
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/data/entities/date_entity.dart';
import 'package:scheduleapp/data/entities/lesson_time_entity.dart';

part 'lesson_entity.freezed.dart';
part 'lesson_entity.g.dart';

@freezed
class Lesson with _$Lesson {

  const factory Lesson( {
    @Default("") String id,
    @Default("")String subject,
    @Default(SubjectType.lesson)SubjectType subjectType,
    @Default("") String teacher,
    @Default(LessonType.person) LessonType lessonType,
    @Default(LessonTime())LessonTime time,
    @Default("")String classroom,
    @Default(Date()) Date date,
    @Default(0)int subgroup,

  }


  ) = _Lesson;

  factory Lesson.fromJson(Map<String, Object?> json) => _$LessonFromJson(json);
}

