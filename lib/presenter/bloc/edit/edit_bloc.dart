import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/presenter/bloc/edit/edit_event.dart';
import 'package:scheduleapp/presenter/bloc/edit/edit_state.dart';

import '../../../core/constants/constants.dart';


class EditBloc extends Bloc<EditEvent, EditState> {

  EditBloc() :
        super(const EditState())

  {
    on <EditEventHide> (_hide);
    on <EditEventShow> (_show);
    on <EditEventSelectAll> (_selectAll);
    on <EditEventUnselectALl> (_unselectAll);
    on<EditEventSetActive> (_setActive);
    on<EditEventSetInactive> (_setInactive);
    on<EditEventAddLesson> (_add);
    on<EditEventDeleteLesson> (_delete);
  }
  _add(EditEventAddLesson event, Emitter<EditState> emit){
    Map<Weekday,List<String>> temp = {};
    state.selectedLessons.forEach((key, value) {temp[key] = value; });
    if(temp.containsKey(event.day)){
      temp[event.day]!.add(event.id);
    } else {

      temp[event.day] = [event.id];
    }
    emit(state.copyWith(selectedLessons: temp,selectedCount: state.selectedCount+1));
  }
  _delete(EditEventDeleteLesson event, Emitter<EditState> emit) {
    Map<Weekday,List<String>> temp = {};
    state.selectedLessons.forEach((key, value) {temp[key] = value; });
    if(temp.containsKey(event.day)){
      temp[event.day]!.remove(event.id);
    }
    emit(state.copyWith(selectedLessons: temp,selectedCount: state.selectedCount-1));
  }
  _setInactive(EditEventSetInactive event, Emitter<EditState> emit)  {
    emit(state.copyWith(status: EditStateStatus.hide));
  }
  _setActive(EditEventSetActive event, Emitter<EditState> emit)  {
    emit(state.copyWith(status: EditStateStatus.show));
  }
  _hide(EditEventHide event, Emitter<EditState> emit)  {}
  _show(EditEventShow event, Emitter<EditState> emit)  {}
  _selectAll(EditEventSelectAll event, Emitter<EditState> emit)  {}
  _unselectAll(EditEventUnselectALl event, Emitter<EditState> emit)  {


  }
}
