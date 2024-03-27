
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduleapp/core/constants/constants.dart';

part 'edit_state.freezed.dart';

enum EditStateStatus {
  initial,
  show,
  hide,
}

@freezed
class EditState with _$EditState {
  const factory EditState({
    @Default(EditStateStatus.initial) EditStateStatus status,
    @Default({}) Map<Weekday,List<String>> selectedLessons,
    @Default(0) int selectedCount,
    Exception? error,
  }) = _EditState;

  const EditState._();
}

