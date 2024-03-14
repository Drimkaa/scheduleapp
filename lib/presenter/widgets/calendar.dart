
import 'package:flutter/material.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';
import 'package:scheduleapp/core/utils/time/time_service.dart';
import 'package:scheduleapp/data/entities/date_entity.dart';
import 'package:table_calendar/table_calendar.dart';

 showCalendar(BuildContext context) {
  TimeService _instance = TimeService.instance;
  return showDialog<void>(
      context: context,

      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          alignment: Alignment.center,
          contentPadding: const EdgeInsets.only(bottom: 0, top: 0),
          titlePadding: const EdgeInsets.only(top: 0),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
          content:
          SizedBox(
            height: 300,
            width: 150,
            child:  TableCalendar(
              shouldFillViewport: true,
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.monday,
              availableCalendarFormats: {CalendarFormat.month: "Месяц"},
              focusedDay: DateTime.now(),
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(Duration(days: 365)),
              rowHeight: 42,
              sixWeekMonthsEnforced: false,
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: const TextStyle(color: Colors.white),
                weekendStyle: const TextStyle(color: MyColors.first),
              ),
              calendarStyle: CalendarStyle(
                weekendTextStyle: TextStyle(color: MyColors.first),
              ),
            ),
          )
         ,

        );
      });
}