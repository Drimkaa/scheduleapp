import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DayEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DayEventIsCurrent extends DayEvent {
}

class DayEventShowHiddenLessons extends DayEvent {}

class DayEventCloseHiddenLessons extends DayEvent {}
class DayEventOpenEditMode extends DayEvent {}
class DayEventShowButton extends DayEvent {}
class DayEventAddHiddenLesson extends DayEvent {
  final int hiddenLessons;

  DayEventAddHiddenLesson(this.hiddenLessons);


  @override
  List<Object> get props => [hiddenLessons];
}

class DayEventDeleteHiddenLesson extends DayEvent {


}