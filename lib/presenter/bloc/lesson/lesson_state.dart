
import 'package:scheduleapp/data/entities/lesson_entity.dart';


import 'package:freezed_annotation/freezed_annotation.dart';
part 'lesson_state.freezed.dart';

enum LessonStateStatus {
  initial,
  currentLesson,
  hidden,
  selected,
  editMode,
  success
}

@freezed
class LessonState with _$LessonState {
  const factory LessonState({
    required Lesson lesson,
    @Default(LessonStateStatus.initial) LessonStateStatus status,
    @Default(false) bool hidden,
    @Default(false) bool editMode,
    @Default(false) bool selected,
    @Default(false) bool currentLesson,
    @Default(false) bool isPressed,
    Exception? error,
  }) = _LessonState;

  const LessonState._();
}


