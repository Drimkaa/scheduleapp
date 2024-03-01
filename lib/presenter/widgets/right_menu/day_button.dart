import 'package:flutter/material.dart';


import '../../../core/constants/constants.dart';
import '../../../core/constants/my_colors.dart';
import '../../../core/utils/time/time_service.dart';


class DayWidgetButton extends StatelessWidget {
   DayWidgetButton({
    Key? key,
    required this.day,
    required this.position,
    required this.length,
    required this.onPressed,
    required this.selected,
    required this.currentDay,
  }) : super(key: key);

  final Function() onPressed;
  final Weekday day;
  final int position;
  final int length;
  final int selected;
  final bool currentDay;
   final Color _inactiveColor= const MyColors().dark_1;


  @override
  Widget build(BuildContext context) {
        return InkWell(
          onTap: onPressed,
          child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: currentDay
                  ? HSVColor.fromAHSV(1, 150 + (length.toDouble() - position) * 10, 1, 1).toColor()
                  : _inactiveColor,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                if (selected == position)
                  BoxShadow(
                    color: HSVColor.fromAHSV(1, 150 + (length.toDouble() - position) * 10, 1, 1).toColor(),
                    spreadRadius: 1,
                    blurRadius: 6,
                  ),
              ],
            ),
            child: Center(
              child: Text(
                day.shortName,
                style: TextStyle(
                  color: HSVColor.fromAHSV(1, 150 + (length.toDouble() - position) * 10, 0.7, 0.6).toColor(),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        );
      }

}