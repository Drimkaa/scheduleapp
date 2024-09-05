import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';

import 'lesson_event.dart';
import 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
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
    on<LessonEventStartScroll>(_goBack);
  }
  _goBack(LessonEventStartScroll event, Emitter<LessonState> emit) async {
    if (state.isPressed) {
      emit(state.copyWith(isPressed: false));
    }
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
