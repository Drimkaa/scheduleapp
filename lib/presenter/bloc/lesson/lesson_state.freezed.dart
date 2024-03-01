// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LessonState {
  Lesson get lesson => throw _privateConstructorUsedError;
  LessonStateStatus get status => throw _privateConstructorUsedError;
  bool get hidden => throw _privateConstructorUsedError;
  bool get editMode => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  bool get currentLesson => throw _privateConstructorUsedError;
  bool get isPressed => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LessonStateCopyWith<LessonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonStateCopyWith<$Res> {
  factory $LessonStateCopyWith(
          LessonState value, $Res Function(LessonState) then) =
      _$LessonStateCopyWithImpl<$Res, LessonState>;
  @useResult
  $Res call(
      {Lesson lesson,
      LessonStateStatus status,
      bool hidden,
      bool editMode,
      bool selected,
      bool currentLesson,
      bool isPressed,
      Exception? error});

  $LessonCopyWith<$Res> get lesson;
}

/// @nodoc
class _$LessonStateCopyWithImpl<$Res, $Val extends LessonState>
    implements $LessonStateCopyWith<$Res> {
  _$LessonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lesson = null,
    Object? status = null,
    Object? hidden = null,
    Object? editMode = null,
    Object? selected = null,
    Object? currentLesson = null,
    Object? isPressed = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      lesson: null == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as Lesson,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LessonStateStatus,
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLesson: null == currentLesson
          ? _value.currentLesson
          : currentLesson // ignore: cast_nullable_to_non_nullable
              as bool,
      isPressed: null == isPressed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$LessonStateImplCopyWith<$Res>
    implements $LessonStateCopyWith<$Res> {
  factory _$$LessonStateImplCopyWith(
          _$LessonStateImpl value, $Res Function(_$LessonStateImpl) then) =
      __$$LessonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Lesson lesson,
      LessonStateStatus status,
      bool hidden,
      bool editMode,
      bool selected,
      bool currentLesson,
      bool isPressed,
      Exception? error});

  @override
  $LessonCopyWith<$Res> get lesson;
}

/// @nodoc
class __$$LessonStateImplCopyWithImpl<$Res>
    extends _$LessonStateCopyWithImpl<$Res, _$LessonStateImpl>
    implements _$$LessonStateImplCopyWith<$Res> {
  __$$LessonStateImplCopyWithImpl(
      _$LessonStateImpl _value, $Res Function(_$LessonStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lesson = null,
    Object? status = null,
    Object? hidden = null,
    Object? editMode = null,
    Object? selected = null,
    Object? currentLesson = null,
    Object? isPressed = null,
    Object? error = freezed,
  }) {
    return _then(_$LessonStateImpl(
      lesson: null == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as Lesson,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LessonStateStatus,
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLesson: null == currentLesson
          ? _value.currentLesson
          : currentLesson // ignore: cast_nullable_to_non_nullable
              as bool,
      isPressed: null == isPressed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$LessonStateImpl extends _LessonState {
  const _$LessonStateImpl(
      {required this.lesson,
      this.status = LessonStateStatus.initial,
      this.hidden = false,
      this.editMode = false,
      this.selected = false,
      this.currentLesson = false,
      this.isPressed = false,
      this.error})
      : super._();

  @override
  final Lesson lesson;
  @override
  @JsonKey()
  final LessonStateStatus status;
  @override
  @JsonKey()
  final bool hidden;
  @override
  @JsonKey()
  final bool editMode;
  @override
  @JsonKey()
  final bool selected;
  @override
  @JsonKey()
  final bool currentLesson;
  @override
  @JsonKey()
  final bool isPressed;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'LessonState(lesson: $lesson, status: $status, hidden: $hidden, editMode: $editMode, selected: $selected, currentLesson: $currentLesson, isPressed: $isPressed, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonStateImpl &&
            (identical(other.lesson, lesson) || other.lesson == lesson) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.currentLesson, currentLesson) ||
                other.currentLesson == currentLesson) &&
            (identical(other.isPressed, isPressed) ||
                other.isPressed == isPressed) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lesson, status, hidden, editMode,
      selected, currentLesson, isPressed, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonStateImplCopyWith<_$LessonStateImpl> get copyWith =>
      __$$LessonStateImplCopyWithImpl<_$LessonStateImpl>(this, _$identity);
}

abstract class _LessonState extends LessonState {
  const factory _LessonState(
      {required final Lesson lesson,
      final LessonStateStatus status,
      final bool hidden,
      final bool editMode,
      final bool selected,
      final bool currentLesson,
      final bool isPressed,
      final Exception? error}) = _$LessonStateImpl;
  const _LessonState._() : super._();

  @override
  Lesson get lesson;
  @override
  LessonStateStatus get status;
  @override
  bool get hidden;
  @override
  bool get editMode;
  @override
  bool get selected;
  @override
  bool get currentLesson;
  @override
  bool get isPressed;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$LessonStateImplCopyWith<_$LessonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
