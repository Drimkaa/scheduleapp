import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

@immutable
abstract class WeekPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetSchedule extends WeekPageEvent {
  final int weekNumber;

  GetSchedule({weekNumber}) : weekNumber=weekNumber??-1;
  @override
  List<Object> get props => [weekNumber];
}

class SetEditMode extends WeekPageEvent {}

class CloseEditMode extends WeekPageEvent {}

class UpdateCount extends WeekPageEvent {
  final int count;

  UpdateCount({count}) : count=count??-1;
  @override
  List<Object> get props => [count];
}
class WeekPageEventHideLesson extends WeekPageEvent {
  final String id;

  WeekPageEventHideLesson({this.id = ""});
  @override
  List<Object> get props => [];
}

class WeekPageEventSelectLesson extends WeekPageEvent {
  final bool select;
  final String id;
  final Weekday day;
  WeekPageEventSelectLesson(this.id,this.day,this.select);

  @override
  List<Object> get props => [id,day,select];
}

class WeekPageEventSelectAll  extends WeekPageEvent {
  final String id;
  WeekPageEventSelectAll({this.id = ""});
  @override
  List<Object> get props => [id];
}
class WeekPageEventEditLesson  extends WeekPageEvent {}
class WeekPageEventHide  extends WeekPageEvent {}