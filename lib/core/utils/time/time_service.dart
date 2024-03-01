

import 'package:scheduleapp/core/constants/constants.dart';
export 'package:scheduleapp/core/constants/constants.dart';
class TimeService {
  TimeService._();
  static TimeService? _instance;
  static TimeService get instance  {
    _instance ??= TimeService._();
    return _instance!;
  }

  bool isCurrentDay({required Weekday day}) {
    int pos = DateTime.now().weekday;
    if(day.pos+1 == pos){
      return true;
    } else {
      return false;
    }
  }

  get currentTime {
    return DateTime.now();
  }


  get day {
    return currentTime.weekday;
  }
  Weekday get weekday {
    var temp = day;
    return Weekday.fromPos(temp-1);
  }
  int get currentWeek {

    return weekNumber;
  }
  get semester {
    int currentMonth = currentTime.month;
    return currentMonth>=9 && currentMonth < 2 ? 1 : 2;
  }
 int get weekNumber {

    if(semester == 2) {
      return ((currentTime.difference(DateTime(currentTime.year, 2, 9, 0, 0)).inDays+ DateTime(currentTime.year, 2, 9, 0, 0).weekday) / 7) .ceil();
    } else {
      return ((currentTime.difference(DateTime(currentTime.year, 9, 0, 0, 0)).inDays+ DateTime(currentTime.year, 9, 0, 0, 0).weekday) / 7) .ceil();

    }
  }
  get hours{
    return currentTime.hour;
  }
  get minutes{
    return currentTime.minute;
  }
  get seconds{
    return currentTime.second;
  }
  int get currentDayTime{
    return hours * 3600 + minutes * 60 + seconds;
  }
  int get  timestamp {
    return currentTime.millisecondsSinceEpoch;
  }
}