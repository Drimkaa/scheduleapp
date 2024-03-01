import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

@immutable
abstract class EditEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class EditEventSetActive extends EditEvent {
}
class EditEventSetInactive extends EditEvent {
}
class EditEventSelectAll extends EditEvent {
}
class EditEventUnselectALl extends EditEvent {
}
class EditEventHide extends EditEvent {
}
class EditEventShow extends EditEvent {
}
class EditEventAddLesson extends EditEvent {
  final String id;
  final Weekday day;
  EditEventAddLesson(this.id,this.day);

  @override
  List<Object> get props => [id];
}

class EditEventDeleteLesson extends EditEvent {
  final String id;
  final Weekday day;
  EditEventDeleteLesson(this.id,this.day);

  @override
  List<Object> get props => [id];
}