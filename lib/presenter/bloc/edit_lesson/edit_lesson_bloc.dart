import 'package:flutter_bloc/flutter_bloc.dart';
import 'edit_lesson_event.dart';
import 'edit_lesson_state.dart';

class EditLessonBloc extends Bloc<EditLessonEvent, EditLessonState> {
  EditLessonBloc() :
        super(const EditLessonState());
}