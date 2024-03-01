import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum EditTypeOpen { edit, add }

@immutable
abstract class EditLessonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EditLessonEventOpen extends EditLessonEvent {
  final EditTypeOpen type;

  EditLessonEventOpen({required this.type});
  @override
  List<Object> get props => [type];

}

class EditLessonEventClose extends EditLessonEvent {}

class EditLessonEventSave extends EditLessonEvent {}
