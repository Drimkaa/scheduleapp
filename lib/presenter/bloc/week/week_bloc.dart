
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/data/entities/day_entity.dart';
import 'package:scheduleapp/data/usecase/get_weeks.dart';
import 'package:scheduleapp/presenter/bloc/day/day_bloc.dart';
import 'package:scheduleapp/presenter/bloc/day/day_event.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_event.dart';
import 'package:scheduleapp/presenter/bloc/week/week_event.dart';
import 'package:scheduleapp/presenter/bloc/week/week_state.dart';

import '../lesson/lesson_bloc.dart';

export 'week_event.dart';
export 'week_state.dart';


class WeekPageBloc extends Bloc<WeekPageEvent, WeekPageState> {
  final GetWeekDaysSchedule getWeekDaysSchedule;
  bool editMode = false;
  List<DayBloc> days = [];
  WeekPageBloc({required this.getWeekDaysSchedule}) : super(const WeekPageState()) {
    on<GetSchedule>(_onLoadStarted);
    on<SetEditMode>(_onSetEditMode);
    on<CloseEditMode>(_onCloseEditMode);
    on<WeekPageEventSelectLesson>(_selectLesson);
    on<WeekPageEventUpdateSubgroup>(_updateSchedule);
    on<WeekPageEventSelectAll>(_selectAll);
    on<WeekPageEventEditLesson>(_editLesson);
    on<WeekPageEventHide>(_hideLessons);
    on<WeekPageEventHideLesson>(_hideLesson);
  }
  _selectLesson(WeekPageEventSelectLesson event, Emitter<WeekPageState> emit) async {
    Map<Weekday, List<String>> temp = {};
    bool allIsHidden = false;

    state.selectedLessons.forEach((key, value) {
      temp[key] = value;
    });
    int count = 0;
    int hiddenCount = 0;
    for (var element in state.schedule) {
      count += element.state.lessons.length;
      for (var lesson in element.state.lessons) {
        if (lesson.state.lesson.id == event.id && lesson.state.hidden) {
          if (!event.select) {
            continue;
          }
          hiddenCount += 1;
          continue;
        }

        if (temp.containsKey(element.day.day)) {
          if (temp[element.day.day]!.contains(lesson.state.lesson.id)) {
            if (lesson.state.hidden) {
              hiddenCount += 1;
            }
            //if(lesson.state.lesson.id == event.id &&)
          }
        }

      }
    }
    if (event.select) {
      if (temp.containsKey(event.day)) {
        temp[event.day]!.add(event.id);
      } else {
        temp[event.day] = [event.id];
      }
      bool allSelected = false;

      if (state.selectedCount + 1 == hiddenCount && hiddenCount > 0) {
        allIsHidden = true;
      }
      if (state.selectedCount + 1 == count) {
        allSelected = true;
      }
      emit(state.copyWith(
          selectedLessons: temp, selectedCount: state.selectedCount + 1, allSelected: allSelected, allIsHidden: allIsHidden));
    } else {
      if (temp.containsKey(event.day)) {
        temp[event.day]!.remove(event.id);
      }

      if (state.selectedCount - 1 == hiddenCount && hiddenCount > 0) {
        allIsHidden = true;
      }

      emit(state.copyWith(
          selectedLessons: temp, selectedCount: state.selectedCount - 1, allSelected: false, allIsHidden: allIsHidden));
    }
  }

  _selectAll(WeekPageEventSelectAll event, Emitter<WeekPageState> emit) async {
    if (state.allSelected) {
      for (var element in state.schedule) {
        for (var lesson in element.state.lessons) {
          lesson.add(LessonEventUnselect());
        }
      }
      emit(state.copyWith(selectedLessons: {}, selectedCount: 0, allSelected: false));
    } else {
      int count = 0;
      Map<Weekday, List<String>> temp = {};
      for (var element in state.schedule) {
        temp[element.day.day] = [];
        for (var lesson in element.state.lessons) {
          temp[element.day.day]!.add(lesson.state.lesson.id);
          count += 1;
          lesson.add(LessonEventSelect());
        }
      }
      emit(state.copyWith(selectedLessons: temp, selectedCount: count, allSelected: true));
    }
  }

  _editLesson(WeekPageEventEditLesson event, Emitter<WeekPageState> emit) async {}
  _hideLessons(WeekPageEventHide event, Emitter<WeekPageState> emit) async {
    Map<Weekday, List<String>> temp = state.selectedLessons;
    List<LessonBloc> lessons = [];
    bool someIsHidden = false;
    bool someIsShowed = false;
    for (var element in state.schedule) {
      if (temp.containsKey(element.day.day)) {
        for (var lesson in element.state.lessons) {
          if (temp[element.day.day]!.contains(lesson.state.lesson.id)) {
            lessons.add(lesson);
            if (lesson.state.hidden) {
              someIsHidden = true;
            } else {
              someIsShowed = true;
            }
            if (someIsHidden && someIsShowed) {
              break;
            }
          }
        }
        if (someIsHidden && someIsShowed) {
          break;
        }
      }
    }
    if (someIsShowed) {
      for (var element in lessons) {
        element.add(LessonEventHide());
      }
      for (var element in state.schedule) {
        if (temp.containsKey(element.day.day)) {
          element.add(DayEventAddHiddenLesson(temp[element.day.day]!.length));
          element.add(DayEventCloseHiddenLessons());
        }
      }
    } else if (!someIsShowed) {
      for (var element in lessons) {
        element.add(LessonEventShow());
      }
      for (var element in state.schedule) {
        if (temp.containsKey(element.day.day)) {
          element.add(DayEventDeleteHiddenLesson());
        }
      }
    }
    for (var element in state.schedule) {
      for (var lesson in element.state.lessons) {
        lesson.add(LessonEventCloseEditMode());
      }
    }
    emit(state.copyWith(editMode: false, selectedCount: 0, selectedLessons: {}));
  }
  _hideLesson(WeekPageEventHideLesson event, Emitter<WeekPageState> emit) async {
    for (var element in state.schedule) {
      for (var lesson in element.state.lessons) {
        if (lesson.state.lesson.id == event.id) {
          if(lesson.state.hidden){
            lesson.add(LessonEventShow());
          } else {
            lesson.add(LessonEventHide());
          }

        }
      }
    }
  }
  _onLoadStarted(GetSchedule event, Emitter<WeekPageState> emit) async {
    if(event.weekNumber == state.weekNumber && state.schedule.isNotEmpty) {
      return;
    }
    emit(state.copyWith(status: WeekPageStateStatus.loading));
    try {
      final int weekNumber = event.weekNumber;

      List value = await getWeekDaysSchedule.getWeekDays(number: weekNumber);
      List<Day> schedule = value[0];
      if (schedule.isNotEmpty) {
        days = schedule.map((e) => DayBloc(day: e, weekNumber: weekNumber)).toList();
        emit(state.copyWith(status: WeekPageStateStatus.success, schedule: days, weekNumber: value[1]));
      } else {
        emit(state.copyWith(status: WeekPageStateStatus.error));
      }
    } on Exception {
      emit(state.copyWith(status: WeekPageStateStatus.error));
    }
  }
  _updateSchedule(WeekPageEventUpdateSubgroup event, Emitter<WeekPageState> emit) async {

    emit(state.copyWith(status: WeekPageStateStatus.loading));
    try {
      final int weekNumber = state.weekNumber;

      List value = await getWeekDaysSchedule.getWeekDays(number: weekNumber);
      List<Day> schedule = value[0];
      if (schedule.isNotEmpty) {
        days = schedule.map((e) => DayBloc(day: e, weekNumber: weekNumber)).toList();
        emit(state.copyWith(status: WeekPageStateStatus.success, schedule: days, weekNumber: value[1]));
      } else {
        emit(state.copyWith(status: WeekPageStateStatus.error));
      }
    } on Exception {
      emit(state.copyWith(status: WeekPageStateStatus.error));
    }
  }
  _onCloseEditMode(CloseEditMode event, Emitter<WeekPageState> emit) async {
    for (var element in state.schedule) {
      for (var lesson in element.state.lessons) {
        lesson.add(LessonEventCloseEditMode());
      }
    }
    emit(state.copyWith(editMode: false, selectedCount: 0, selectedLessons: {}, allSelected: false));
  }

  _onSetEditMode(SetEditMode event, Emitter<WeekPageState> emit) async {
    try {
      for (var element in state.schedule) {
        element.add(DayEventOpenEditMode());
      }
      emit(state.copyWith(editMode: true));
    } on Exception {
      emit(state.copyWith(status: WeekPageStateStatus.error));
    }
  }
}
