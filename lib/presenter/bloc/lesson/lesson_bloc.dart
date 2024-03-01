import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';

import '../week/week_bloc.dart';
import '../week/week_event.dart';
import 'lesson_event.dart';
import 'lesson_state.dart';

@immutable
class LessonBloc extends Bloc<LessonEvent, LessonState> {
  bool isPressed = false;
  LessonBloc({required Lesson lesson}) : super(LessonState(lesson: lesson)) {
    on<LessonEventOpenEditMode>(_openEditMode);
    on<LessonEventCloseEditMode>(_closeEditMode);
    on<LessonEventSelect>(_selectLesson);
    on<LessonEventUnselect>(_unselectLesson);
    on<LessonEventHide>(_hideLesson);
    on<LessonEventShow>(_showLesson);
    on<LessonEventPressDown>(_pressDownLesson);
    on<LessonEventPressUp>(_pressUpLesson);
    on<LessonEventPressCancel>(_pressCancelLesson);
  }
  _hideLesson(LessonEventHide event, Emitter<LessonState> emit) {
    emit(state.copyWith(hidden: true));
  }

  _showLesson(LessonEventShow event, Emitter<LessonState> emit) {
    emit(state.copyWith(hidden: false));
  }

  _pressUpLesson(LessonEventPressUp event, Emitter<LessonState> emit) async {
    if (state.editMode) {
      if (state.selected) {
        emit(state.copyWith(selected: false, isPressed: false));
      } else {
        emit(state.copyWith(selected: true, isPressed: false));
      }
    } else {
      emit(state.copyWith(selected: true, editMode: true, isPressed: false));
    }
  }

  _pressCancelLesson(LessonEventPressCancel event, Emitter<LessonState> emit) {
    if (state.editMode) {
      if (state.selected) {
        emit(state.copyWith(selected: false, isPressed: false));
      } else {
        emit(state.copyWith(selected: true, isPressed: false));
      }
    } else {
      emit(state.copyWith(isPressed: false));
    }
  }

  _pressDownLesson(LessonEventPressDown event, Emitter<LessonState> emit) async {
    emit(state.copyWith(isPressed: true));
  }

  _openEditMode(LessonEventOpenEditMode event, Emitter<LessonState> emit) async {
    emit(state.copyWith(editMode: true));
  }

  _closeEditMode(LessonEventCloseEditMode event, Emitter<LessonState> emit) async {
    emit(state.copyWith(
      editMode: false,
      selected: false,
    ));
  }

  _selectLesson(LessonEventSelect event, Emitter<LessonState> emit) async {
    emit(state.copyWith(editMode: true, selected: true));
  }

  _unselectLesson(LessonEventUnselect event, Emitter<LessonState> emit) async {
    emit(state.copyWith(editMode: true, selected: false));
  }
}
