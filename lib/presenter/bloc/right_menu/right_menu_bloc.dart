
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/core/utils/time/time_service.dart';
import 'right_menu_event.dart';
import 'right_menu_state.dart';

class RightMenuBloc extends Bloc<RightMenuEvent, RightMenuState> {
  bool isPressed = false;
  final TimeService _serv = TimeService.instance;
  RightMenuBloc() : super(const RightMenuState()) {
    on<RightMenuEventMoveTo>(_moveTo);
    on<RightMenuEventInitialize>(_initialize);
  }
  _moveTo(RightMenuEventMoveTo event, Emitter<RightMenuState> emit) async {
    if (isPressed) return;
    isPressed = true;
    if (event.day > -1 && event.day != state.selected) {
      await Scrollable.ensureVisible(state.keys[event.day].currentContext!,
              curve: Curves.linear, duration: const Duration(milliseconds: 100))
          .whenComplete(() => {});
    }
    emit(state.copyWith(selected: event.day));
    isPressed = false;
  }

  _initialize(RightMenuEventInitialize event, Emitter<RightMenuState> emit) async {
    emit(state.copyWith(
        keys: event.daysKeys,
        days: event.days,
        currentWeek: event.weekNumber == _serv.currentWeek,
        currentDay: event.weekNumber == _serv.currentWeek ? _serv.day - 1 : -1));
  }
}
