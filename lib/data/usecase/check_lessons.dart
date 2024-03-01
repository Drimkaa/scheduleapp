
import 'package:scheduleapp/core/utils/time/time_service.dart';

class CheckCurrentTimeUseCase {
  late TimeService service = TimeService.instance;
  CheckCurrentTimeUseCase._();
  static CheckCurrentTimeUseCase? _instance;
  static CheckCurrentTimeUseCase get instance  {
    _instance ??= CheckCurrentTimeUseCase._();
    return _instance!;
  }

  bool isCurrentDay({required int week, required int day})  {

    if(service.currentWeek==week && day == service.weekday.pos){
      return true;
    }
    return false;
  }
  bool isCurrentLesson({required bool isCurrentDay, required int start, required int end})  {

    if(isCurrentDay && start > service.currentDayTime && end < service.currentDayTime){
      return true;
    }
    return false;
  }
}