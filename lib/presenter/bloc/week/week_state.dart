import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/presenter/bloc/day/day_bloc.dart';



import 'package:scheduleapp/data/entities/lesson_entity.dart';


import 'package:freezed_annotation/freezed_annotation.dart';
part 'week_state.freezed.dart';

enum WeekPageStateStatus {
  initial,
  loading,
  success,
  error,
  editMode,
}

@freezed
class WeekPageState with _$WeekPageState {
  const factory WeekPageState({
    @Default(WeekPageStateStatus.initial) WeekPageStateStatus status,
    @Default([]) List<DayBloc> schedule,
    @Default(false) bool editMode,
    @Default(-1) int weekNumber,
    @Default({}) Map<Weekday,List<String>> selectedLessons,
    @Default(0) int selectedCount,
    @Default(false) bool allSelected,
    @Default(false) bool allIsHidden,
    @Default(false) bool allIsShowed,
    Exception? error,
  }) = _WeekPageState;
  Lesson getSelectedLesson() {
      Weekday day = selectedLessons.keys.first;
      String id = selectedLessons[day]!.first;
      return schedule.firstWhere((element) => element.day.day == day).state.lessons.firstWhere((element) => element.state.lesson.id == id).state.lesson;




  }
  const WeekPageState._();
}
