
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduleapp/core/constants/constants.dart';

import '../lesson/lesson_bloc.dart';
part 'day_state.freezed.dart';

enum DateStateStatus {
  initial,
  currentDay,
  displayLessons,
  hideLessons,
  success,
  failure,
}

@freezed
class DayState with _$DayState {
  const factory DayState({
    @Default(DateStateStatus.initial) DateStateStatus status,
    @Default([]) List<LessonBloc> lessons,
    @Default(Weekday.monday) Weekday day,
    @Default(false) bool displayHiddenLessons,
    @Default(0) int hiddenLessons,
    @Default(false) bool currentDay,
    @Default(false) bool showLessons,
    Exception? error,
  }) = _DayState;

  const DayState._();
}

