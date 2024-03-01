// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return _Lesson.fromJson(json);
}

/// @nodoc
mixin _$Lesson {
  String get id => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  SubjectType get subjectType => throw _privateConstructorUsedError;
  String get teacher => throw _privateConstructorUsedError;
  LessonType get lessonType => throw _privateConstructorUsedError;
  LessonTime get time => throw _privateConstructorUsedError;
  String get classroom => throw _privateConstructorUsedError;
  Date get date => throw _privateConstructorUsedError;
  int get subgroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonCopyWith<Lesson> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonCopyWith<$Res> {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) then) =
      _$LessonCopyWithImpl<$Res, Lesson>;
  @useResult
  $Res call(
      {String id,
      String subject,
      SubjectType subjectType,
      String teacher,
      LessonType lessonType,
      LessonTime time,
      String classroom,
      Date date,
      int subgroup});

  $LessonTimeCopyWith<$Res> get time;
  $DateCopyWith<$Res> get date;
}

/// @nodoc
class _$LessonCopyWithImpl<$Res, $Val extends Lesson>
    implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subject = null,
    Object? subjectType = null,
    Object? teacher = null,
    Object? lessonType = null,
    Object? time = null,
    Object? classroom = null,
    Object? date = null,
    Object? subgroup = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      subjectType: null == subjectType
          ? _value.subjectType
          : subjectType // ignore: cast_nullable_to_non_nullable
              as SubjectType,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String,
      lessonType: null == lessonType
          ? _value.lessonType
          : lessonType // ignore: cast_nullable_to_non_nullable
              as LessonType,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as LessonTime,
      classroom: null == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Date,
      subgroup: null == subgroup
          ? _value.subgroup
          : subgroup // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LessonTimeCopyWith<$Res> get time {
    return $LessonTimeCopyWith<$Res>(_value.time, (value) {
      return _then(_value.copyWith(time: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DateCopyWith<$Res> get date {
    return $DateCopyWith<$Res>(_value.date, (value) {
      return _then(_value.copyWith(date: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LessonImplCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$$LessonImplCopyWith(
          _$LessonImpl value, $Res Function(_$LessonImpl) then) =
      __$$LessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String subject,
      SubjectType subjectType,
      String teacher,
      LessonType lessonType,
      LessonTime time,
      String classroom,
      Date date,
      int subgroup});

  @override
  $LessonTimeCopyWith<$Res> get time;
  @override
  $DateCopyWith<$Res> get date;
}

/// @nodoc
class __$$LessonImplCopyWithImpl<$Res>
    extends _$LessonCopyWithImpl<$Res, _$LessonImpl>
    implements _$$LessonImplCopyWith<$Res> {
  __$$LessonImplCopyWithImpl(
      _$LessonImpl _value, $Res Function(_$LessonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subject = null,
    Object? subjectType = null,
    Object? teacher = null,
    Object? lessonType = null,
    Object? time = null,
    Object? classroom = null,
    Object? date = null,
    Object? subgroup = null,
  }) {
    return _then(_$LessonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      subjectType: null == subjectType
          ? _value.subjectType
          : subjectType // ignore: cast_nullable_to_non_nullable
              as SubjectType,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String,
      lessonType: null == lessonType
          ? _value.lessonType
          : lessonType // ignore: cast_nullable_to_non_nullable
              as LessonType,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as LessonTime,
      classroom: null == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Date,
      subgroup: null == subgroup
          ? _value.subgroup
          : subgroup // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonImpl with DiagnosticableTreeMixin implements _Lesson {
  const _$LessonImpl(
      {this.id = "",
      this.subject = "",
      this.subjectType = SubjectType.lesson,
      this.teacher = "",
      this.lessonType = LessonType.person,
      this.time = const LessonTime(),
      this.classroom = "",
      this.date = const Date(),
      this.subgroup = 0});

  factory _$LessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String subject;
  @override
  @JsonKey()
  final SubjectType subjectType;
  @override
  @JsonKey()
  final String teacher;
  @override
  @JsonKey()
  final LessonType lessonType;
  @override
  @JsonKey()
  final LessonTime time;
  @override
  @JsonKey()
  final String classroom;
  @override
  @JsonKey()
  final Date date;
  @override
  @JsonKey()
  final int subgroup;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Lesson(id: $id, subject: $subject, subjectType: $subjectType, teacher: $teacher, lessonType: $lessonType, time: $time, classroom: $classroom, date: $date, subgroup: $subgroup)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Lesson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('subject', subject))
      ..add(DiagnosticsProperty('subjectType', subjectType))
      ..add(DiagnosticsProperty('teacher', teacher))
      ..add(DiagnosticsProperty('lessonType', lessonType))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('classroom', classroom))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('subgroup', subgroup));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.subjectType, subjectType) ||
                other.subjectType == subjectType) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.lessonType, lessonType) ||
                other.lessonType == lessonType) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.classroom, classroom) ||
                other.classroom == classroom) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.subgroup, subgroup) ||
                other.subgroup == subgroup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, subject, subjectType,
      teacher, lessonType, time, classroom, date, subgroup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      __$$LessonImplCopyWithImpl<_$LessonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonImplToJson(
      this,
    );
  }
}

abstract class _Lesson implements Lesson {
  const factory _Lesson(
      {final String id,
      final String subject,
      final SubjectType subjectType,
      final String teacher,
      final LessonType lessonType,
      final LessonTime time,
      final String classroom,
      final Date date,
      final int subgroup}) = _$LessonImpl;

  factory _Lesson.fromJson(Map<String, dynamic> json) = _$LessonImpl.fromJson;

  @override
  String get id;
  @override
  String get subject;
  @override
  SubjectType get subjectType;
  @override
  String get teacher;
  @override
  LessonType get lessonType;
  @override
  LessonTime get time;
  @override
  String get classroom;
  @override
  Date get date;
  @override
  int get subgroup;
  @override
  @JsonKey(ignore: true)
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
