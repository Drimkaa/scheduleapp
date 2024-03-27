import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';
import 'package:scheduleapp/core/utils/time/time_service.dart';
import 'package:table_calendar/table_calendar.dart';

showCalendar(BuildContext context) {
  TimeService instance = TimeService.instance;
  return showDialog<void>(
    context: context,

    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: AlertDialog(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          alignment: Alignment.center,
          contentPadding: const EdgeInsets.only(bottom: 0, top: 0),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          titlePadding: const EdgeInsets.only(top: 0),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
          content: Container(
            color: MyColors.dark_3,
            height: 300,
            width: 300,
            child: TableCalendar(
              locale: Localizations.localeOf(context).languageCode,
              shouldFillViewport: true,
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.monday,
              availableCalendarFormats: const {CalendarFormat.month: "Месяц"},
              focusedDay: DateTime.now(),
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(const Duration(days: 365)),
              rowHeight: 42,
              sixWeekMonthsEnforced: false,
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.white),
                weekendStyle: TextStyle(color: MyColors.first),
              ),
              headerStyle: const HeaderStyle(
                  decoration: BoxDecoration(
                color: Colors.transparent,
              )),
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: MyColors.second,
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: TextStyle(color: MyColors.first),
              ),
            ),
          ),
        ),
      );
    },
  );
}
