import 'package:flutter/material.dart';

import 'calendar_widfet.dart';

showCalendar(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return const CalendarDialog();
    },
  );
}