


import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_time_entity.freezed.dart';
part 'lesson_time_entity.g.dart';

@freezed
class LessonTime with _$LessonTime {
  const factory LessonTime({
    @Default("8:00") String start,
    @Default("9:35") String end,
    @Default("1 пара") String label,
  }) = _LessonTime;

  factory LessonTime.fromJson(Map<String, Object?> json) => _$LessonTimeFromJson(json);
}

extension LessonTimeX on LessonTime {
  int get startInt  {
    List<String> time = start.split(":");
    return  int.parse(time[0])*3600 + int.parse(time[1])*60;
  }
  int get startEnd  {
    List<String> time = end.split(":");
    return  int.parse(time[0])*3600 + int.parse(time[1])*60;
  }
}