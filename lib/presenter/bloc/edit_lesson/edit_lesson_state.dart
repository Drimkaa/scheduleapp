import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';

part 'edit_lesson_state.freezed.dart';

enum EditLessonStateStatus {
  initial,
  addLesson,
  editLesson,
}

@freezed
class EditLessonState with _$EditLessonState {
  const factory EditLessonState({
    @Default(EditLessonStateStatus.initial) EditLessonStateStatus status,
    @Default(Lesson()) Lesson lesson,
    Exception? error,
  }) = _EditLessonState;

  const EditLessonState._();
}