
import 'dart:math';

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
extension RandomListItem<T> on List<T> {
  T randomItem() {
    return this[Random().nextInt(length)];
  }
}
List<String> splitString(String input, int maxLength) {
  List<String> substrings = [];
  List<String> words = input.split(' ');
  String currentSubstring = '';

  for (int i = 0; i < words.length; i++) {
    String word = words[i];

    if ((currentSubstring.length + word.length) <= maxLength) {
      // Если добавление этого слова не превысит максимальную длину, добавляем его к текущей подстроке
      if (currentSubstring.isNotEmpty) {
        currentSubstring += ' ';
      }
      currentSubstring += word;
    } else {
      // Иначе добавляем текущую подстроку в список и начинаем новую
      substrings.add(currentSubstring);
      currentSubstring = word;
    }
  }

  // Добавляем последнюю подстроку
  if (currentSubstring.isNotEmpty) {
    substrings.add(currentSubstring);
  }

  return substrings;
}
splitToChunks(String list, int maxLength,String icon,String subicon) {
  String chunks = "";
  List<String> chunk = splitString(list, maxLength);
  for (int i = 0; i < chunk.length; i++) {
    chunks+="${i==0?"$icon  ":(list.length/maxLength).ceil()-1>i?"┃    ":"┗━ "} ${chunk[i]}\n";

  }

  return chunks;
}
extension LessonExt on Lesson {
  String toSharedString(int index) {
    String randomLesson = ["📒","📕","📗","📙","📔","📘","📓"].randomItem();
    String randomTeacher = ["🧑‍💻","🧑‍🏫","🕵️","🧑‍🎓","🧑‍🚀","🥷","🦸","🦹"].randomItem();
    int len = 25;
    //String lessonSubs = "";
    //for( int i = 0; i < (subject.length/20).ceil(); i++){
    //  lessonSubs+="${i==0?"$randomLesson  ":"ㅤ   "}${subject.substring(i*20, min(subject.length, i*20+20))}\n";
    //}
    return "Занятие $index. ${subjectType.shortName} \n${splitToChunks(subject,len,randomLesson,"🚦")}${teacher!=" "? '${splitToChunks(teacher,len,randomTeacher,"🚦")}':""}🕐  ${time.start}-${time.end}\n🏫  $classroom";
  }
}
//