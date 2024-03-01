// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_lesson_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditLessonState {
  EditLessonStateStatus get status => throw _privateConstructorUsedError;
  Lesson get lesson => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditLessonStateCopyWith<EditLessonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditLessonStateCopyWith<$Res> {
  factory $EditLessonStateCopyWith(
          EditLessonState value, $Res Function(EditLessonState) then) =
      _$EditLessonStateCopyWithImpl<$Res, EditLessonState>;
  @useResult
  $Res call({EditLessonStateStatus status, Lesson lesson, Exception? error});

  $LessonCopyWith<$Res> get lesson;
}

/// @nodoc
class _$EditLessonStateCopyWithImpl<$Res, $Val extends EditLessonState>
    implements $EditLessonStateCopyWith<$Res> {
  _$EditLessonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? lesson = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EditLessonStateStatus,
      lesson: null == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as Lesson,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LessonCopyWith<$Res> get lesson {
    return $LessonCopyWith<$Res>(_value.lesson, (value) {
      return _then(_value.copyWith(lesson: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditLessonStateImplCopyWith<$Res>
    implements $EditLessonStateCopyWith<$Res> {
  factory _$$EditLessonStateImplCopyWith(_$EditLessonStateImpl value,
          $Res Function(_$EditLessonStateImpl) then) =
      __$$EditLessonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EditLessonStateStatus status, Lesson lesson, Exception? error});

  @override
  $LessonCopyWith<$Res> get lesson;
}

/// @nodoc
class __$$EditLessonStateImplCopyWithImpl<$Res>
    extends _$EditLessonStateCopyWithImpl<$Res, _$EditLessonStateImpl>
    implements _$$EditLessonStateImplCopyWith<$Res> {
  __$$EditLessonStateImplCopyWithImpl(
      _$EditLessonStateImpl _value, $Res Function(_$EditLessonStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? lesson = null,
    Object? error = freezed,
  }) {
    return _then(_$EditLessonStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EditLessonStateStatus,
      lesson: null == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as Lesson,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$EditLessonStateImpl extends _EditLessonState {
  const _$EditLessonStateImpl(
      {this.status = EditLessonStateStatus.initial,
      this.lesson = const Lesson(),
      this.error})
      : super._();

  @override
  @JsonKey()
  final EditLessonStateStatus status;
  @override
  @JsonKey()
  final Lesson lesson;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'EditLessonState(status: $status, lesson: $lesson, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditLessonStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lesson, lesson) || other.lesson == lesson) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, lesson, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditLessonStateImplCopyWith<_$EditLessonStateImpl> get copyWith =>
      __$$EditLessonStateImplCopyWithImpl<_$EditLessonStateImpl>(
          this, _$identity);
}

abstract class _EditLessonState extends EditLessonState {
  const factory _EditLessonState(
      {final EditLessonStateStatus status,
      final Lesson lesson,
      final Exception? error}) = _$EditLessonStateImpl;
  const _EditLessonState._() : super._();

  @override
  EditLessonStateStatus get status;
  @override
  Lesson get lesson;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$EditLessonStateImplCopyWith<_$EditLessonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
