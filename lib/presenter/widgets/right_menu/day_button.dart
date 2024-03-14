import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/my_colors.dart';

class DayWidgetButton extends StatelessWidget {
  const DayWidgetButton({
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

  static const Color _inactiveColor =  MyColors.dark_1;
  static const double _startHue = 150.0;
  static const double _saturation = 1.0;
  static const double _lightness = 0.7;
  static const double _alpha = 1.0;
  static const double _blurRadius = 6.0;
  static const double _spreadRadius = 1.0;
  static const double _fontSize = 20.0;
  static const FontWeight _fontWeight = FontWeight.w700;

  @override
  Widget build(BuildContext context) {

    final color = currentDay
        ? HSVColor.fromAHSV(
      _alpha,
      _startHue + (length.toDouble() - position) * 10,
      _saturation,
      _lightness,
    ).toColor()
        : _inactiveColor;

    final boxShadow = selected == position
        ? [
      BoxShadow(
        color: HSVColor.fromAHSV(
          _alpha,
          _startHue + (length.toDouble() - position) * 10,
          _saturation,
          _lightness,
        ).toColor(),
        spreadRadius: _spreadRadius,
        blurRadius: _blurRadius,
      ),
    ]
        : null;

    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
          boxShadow: boxShadow,
        ),
        duration: Duration(milliseconds: 200),
        child: Center(
          child: Text(
            day.shortName,
            style: TextStyle(
              color: HSVColor.fromAHSV(
                _alpha,
                _startHue + (length.toDouble() - position) * 10,
                _saturation,
                _lightness * 0.6, // Adjusting lightness for text color
              ).toColor(),
              fontSize: _fontSize,
              fontWeight: _fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}