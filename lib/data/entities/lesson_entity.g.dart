// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonImpl _$$LessonImplFromJson(Map<String, dynamic> json) => _$LessonImpl(
      id: json['id'] as String? ?? "",
      subject: json['subject'] as String? ?? "",
      subjectType:
          $enumDecodeNullable(_$SubjectTypeEnumMap, json['subjectType']) ??
              SubjectType.lesson,
      teacher: json['teacher'] as String? ?? "",
      lessonType:
          $enumDecodeNullable(_$LessonTypeEnumMap, json['lessonType']) ??
              LessonType.person,
      time: json['time'] == null
          ? const LessonTime()
          : LessonTime.fromJson(json['time'] as Map<String, dynamic>),
      classroom: json['classroom'] as String? ?? "",
      date: json['date'] == null
          ? const Date()
          : Date.fromJson(json['date'] as Map<String, dynamic>),
      subgroup: json['subgroup'] as int? ?? 0,
    );

Map<String, dynamic> _$$LessonImplToJson(_$LessonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'subjectType': instance.subjectType,
      'teacher': instance.teacher,
      'lessonType': instance.lessonType,
      'time': instance.time,
      'classroom': instance.classroom,
      'date': instance.date,
      'subgroup': instance.subgroup,
    };

const _$SubjectTypeEnumMap = {
  SubjectType.lesson: 'lesson',
  SubjectType.practice: 'practice',
  SubjectType.lab: 'lab',
};

const _$LessonTypeEnumMap = {
  LessonType.remote: 'remote',
  LessonType.person: 'person',
};
