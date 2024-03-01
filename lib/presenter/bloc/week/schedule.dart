import '../../../core/constants/constants.dart';

class Schedule<T> {
  Map<Weekday,DaySchedule<T>> data = {};
}
class DaySchedule<T> {
  late final T data;


}