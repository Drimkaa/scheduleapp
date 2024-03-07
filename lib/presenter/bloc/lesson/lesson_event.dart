import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LessonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LessonEventSelect extends LessonEvent {
}

class LessonEventUnselect extends LessonEvent {
}
class LessonEventOpenEditMode extends LessonEvent{
}
class LessonEventShow extends LessonEvent{
}
class LessonEventCheckCurrentDay extends LessonEvent {}
class LessonEventHide extends LessonEvent{
}
class LessonEventCloseEditMode extends LessonEvent {}
class LessonEventPressDown extends LessonEvent {

}
class LessonEventPressUp extends LessonEvent {

}
class LessonEventPressCancel extends LessonEvent {

}

class LessonEventStartScroll extends LessonEvent {

}