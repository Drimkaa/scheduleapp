

import 'package:scheduleapp/core/constants/constants.dart';
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
    return currentMonth>=9 || currentMonth < 2 ? 1 : 2;
  }
  DateTime get firstDay {
    if(semester == 2) {
      return DateTime(currentTime.year, 2, 9);
    } else {
      return DateTime(currentTime.year, 9, 1);
    }
  }
  DateTime currentDateTime(int weekNumber) {
    DateTime currentTime = DateTime.now(); // или используйте другую переменную, если текущая дата хранится где-то ещё


    if (semester == 2) {
      // Начальная дата для второго семестра - 9 февраля
      DateTime startOfSemester = DateTime(currentTime.year, 2, 9);
      // Вычисляем дату, добавляя количество недель к начальной дате
      return startOfSemester.add(Duration(days: (weekNumber - 1) * 7));
    } else {
      // Начальная дата для первого семестра - 1 сентября
      DateTime startOfSemester = DateTime(currentTime.year, 9, 1);
      // Вычисляем дату, добавляя количество недель к начальной дате
      return startOfSemester.add(Duration(days: (weekNumber - 1) * 7));
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
  int getWeekNumberFromDate( DateTime date){
    if(semester == 2) {
      DateTime firstDayOfFebruary = DateTime(currentTime.year, 2, 9);
      return ((currentTime.difference(firstDayOfFebruary).inDays + firstDayOfFebruary.weekday - 1) / 7) .ceil();
    } else {
      DateTime firstDayOfSeptember = DateTime(currentTime.year, 9, 1);
      return ((date.difference(firstDayOfSeptember).inDays + firstDayOfSeptember.weekday - 1) / 7) .floor();
    }
  }
 int get weekNumber {

    if(semester == 2) {
      return ((currentTime.difference(DateTime(currentTime.year, 2, 9, 0, 0)).inDays+ DateTime(currentTime.year, 2, 9, 0, 0).weekday) / 7) .ceil();
    } else {
      DateTime firstDayOfSeptember = DateTime(currentTime.year, 9, 1);



      return ((currentTime.difference(firstDayOfSeptember).inDays + firstDayOfSeptember.weekday) / 7) .floor();
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