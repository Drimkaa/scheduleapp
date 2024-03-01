// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_time_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonTimeImpl _$$LessonTimeImplFromJson(Map<String, dynamic> json) =>
    _$LessonTimeImpl(
      start: json['start'] as String? ?? "8:00",
      end: json['end'] as String? ?? "9:35",
      label: json['label'] as String? ?? "1 пара",
    );

Map<String, dynamic> _$$LessonTimeImplToJson(_$LessonTimeImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
      'label': instance.label,
    };
