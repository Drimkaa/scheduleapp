
import 'package:flutter/material.dart';
import 'package:scheduleapp/core/constants/constants.dart';


import 'package:freezed_annotation/freezed_annotation.dart';
part 'right_menu_state.freezed.dart';

enum RightMenuStateStatus {
  initial,
 empty,
  currentWeek,
}

@freezed
class RightMenuState with _$RightMenuState {
  const factory RightMenuState({
    @Default(RightMenuStateStatus.empty) RightMenuStateStatus status,
    @Default(-1) int selected,
    @Default(false) bool currentWeek,
    @Default([]) List<GlobalKey> keys,
    @Default([]) List<Weekday> days,
    @Default(-1) int currentDay,
    @Default(false) bool isPressed,
    Exception? error,
  }) = _RightMenuState;

  const RightMenuState._();
}


