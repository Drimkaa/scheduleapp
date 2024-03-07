

import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/data/entities/date_entity.dart';
export 'package:scheduleapp/core/constants/constants.dart';


List<String> months = [
  'Янв',
  'Фев',
  'Март',
  'Апр',
  'Май',
  'Июнь',
  'Июль',
  'Авг',
  'Сен',
  'Окт',
  'Нояб',
  'Дек'
];
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

  DateTime currentDateTime(int weekNumber){
    int week = weekNumber;
    if(semester==2){

      return DateTime(currentTime.year, 2, 9 + (week-1)*7 - DateTime(currentTime.year, 2, 9, 0, 0).weekday, 0, 0);
    } else {
      return DateTime(currentTime.year, 9, 0 + (week-1)*7 - DateTime(currentTime.year, 9, 0, 0, 0).weekday, 0, 0);
    }
  }
  String getWeekName(int weekNumber) {
    int month = currentDateTime(weekNumber).month-1;
    return months[month];
  }

  int getMonthDay(int weekNumber,Weekday day) {
    int month = currentDateTime(weekNumber).day + day.pos+1;
    return month;
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