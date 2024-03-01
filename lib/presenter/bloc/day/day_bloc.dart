import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/data/entities/day_entity.dart';
import 'package:scheduleapp/data/usecase/check_lessons.dart';
import 'package:scheduleapp/presenter/bloc/day/day_event.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_bloc.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_event.dart';

import 'day_state.dart';

class DayBloc extends Bloc<DayEvent, DayState> {
  final Day day;
  final int weekNumber;
  DayBloc({required this.day,required this.weekNumber}) :
        super(DayState(day: day.day, lessons: day.lessons.map((e) => LessonBloc(lesson:e)).toList()))

  {
    on <DayEventIsCurrent> (_checkDay);
    on <DayEventShowHiddenLessons> (_showLessons);
    on <DayEventCloseHiddenLessons> (_hideLessons);
    on <DayEventOpenEditMode> (_updateLessons);
    on <DayEventAddHiddenLesson> (_addHiddenLesson);
    on <DayEventDeleteHiddenLesson> (_deleteHiddenLesson);
    on <DayEventShowButton> (_pressShowButton);
  }

  _pressShowButton(DayEventShowButton event, Emitter<DayState> emit) async {
    emit(state.copyWith( displayHiddenLessons: !state.displayHiddenLessons));
  }

  _addHiddenLesson(DayEventAddHiddenLesson event, Emitter<DayState> emit) async {
    emit(state.copyWith(hiddenLessons: state.lessons.where((element) => element.state.hidden).length));
  }
  _deleteHiddenLesson(DayEventDeleteHiddenLesson event, Emitter<DayState> emit) async {

    emit(state.copyWith(hiddenLessons: state.lessons.where((element) => element.state.hidden).length,displayHiddenLessons: false));
  }
  _updateLessons(DayEventOpenEditMode event, Emitter<DayState> emit) async {

    try {
      for (var lesson in  state.lessons) {
        lesson.add(LessonEventOpenEditMode());

    }} on Exception catch (e) {
      emit(state.copyWith(status: DateStateStatus.failure));
    }



  }
  _checkDay(DayEventIsCurrent event, Emitter<DayState> emit) async {
    CheckCurrentTimeUseCase useCase =  CheckCurrentTimeUseCase.instance;
    if(useCase.isCurrentDay(week: weekNumber, day: state.day.pos)) {
      emit(state.copyWith(currentDay: true));
    }

  }
  _showLessons(DayEventShowHiddenLessons event, Emitter<DayState> emit) async {
    emit(state.copyWith( displayHiddenLessons: true));
  }
  _hideLessons(DayEventCloseHiddenLessons event, Emitter<DayState> emit) async {
    emit(state.copyWith( displayHiddenLessons: false));
  }
}
