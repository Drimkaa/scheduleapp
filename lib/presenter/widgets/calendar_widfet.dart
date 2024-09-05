import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/presenter/bloc/right_menu/right_menu_event.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';

import '../../core/utils/time/time_service.dart';
import '../bloc/right_menu/right_menu_bloc.dart';
import '../bloc/week/week_bloc.dart';

class CalendarDialog extends StatefulWidget {
  const CalendarDialog({super.key});

  @override
  State<StatefulWidget> createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog> {
  late DateTime selectedDay;
  late DateTime focusedDay;

  @override
  void initState() {
    super.initState();
    selectedDay = DateTime.now();
    focusedDay = DateTime.now();
  }
  TimeService timeService = TimeService.instance;
  @override
  Widget build(BuildContext context) {
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

            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            onDaySelected: (selected, focused) {
              setState(() {
                selectedDay = focused;
                focusedDay = focused;

                BlocProvider.of<WeekPageBloc>(context, listen: false).add(GetSchedule(
                    weekNumber: timeService.getWeekNumberFromDate(selectedDay)));

                Future.delayed(const Duration(milliseconds: 100), () {
                  BlocProvider.of<RightMenuBloc>(context, listen: false).add(RightMenuEventMoveTo(day: focused.weekday - 1));
                });

              });
    },

            locale: Localizations.localeOf(context).languageCode,
            shouldFillViewport: true,

            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            availableCalendarFormats: const {CalendarFormat.month: "Месяц"},
            focusedDay: focusedDay,
            firstDay: timeService.firstDay,
            lastDay: timeService.firstDay.add(const Duration(days: 180)),
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
              selectedDecoration: BoxDecoration(
                color: MyColors.second,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(color: MyColors.dark_3, fontWeight: FontWeight.w400),
              todayTextStyle: TextStyle(color: MyColors.dark_3, fontWeight: FontWeight.w400),
              todayDecoration: BoxDecoration(
                color: MyColors.thirdD,
                shape: BoxShape.circle,
              ),
              weekendTextStyle: TextStyle(color: MyColors.first),
            ),
          ),
        ),
      ),
    );
  }
}