import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    this.iconSize = 36,
  });

  final Function() onPressed;
  final IconData iconData;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: iconSize,
        height: iconSize,
        child: Theme(
          data: Theme.of(context).copyWith(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: IconButton(
            iconSize: iconSize,
            onPressed: onPressed,
            icon: Icon(iconData),
            padding: const EdgeInsets.all(0),
          ),
        ));
  }
}

class CustomColorIconButton extends StatelessWidget {
  const CustomColorIconButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    this.iconSize = 36,
    this.background = Colors.transparent,
    this.radius = 18,
    this.iconColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.borderSize = 2,
    this.boxShadow
  });

  final Function() onPressed;
  final IconData iconData;
  final double iconSize;
  final double radius;
  final Color background;
  final Color iconColor;
  final double borderSize;
  final Color borderColor;
  final BoxShadow? boxShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: iconSize,
        height: iconSize,
        padding: EdgeInsets.only(bottom: 2),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: Border.all(color: borderColor, width: borderSize),

          boxShadow: [boxShadow??BoxShadow(color: Colors.transparent)],

        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: IconButton(
            iconSize: iconSize - 10,
            onPressed: onPressed,
            icon: Icon(iconData,color: iconColor,grade: 0.5,weight: 0.2,fill: 0.1,),
            padding: const EdgeInsets.all(0),
          ),
        ));
  }
}



class CustomColorIcon extends StatelessWidget {
  const CustomColorIcon({
    super.key,
    required this.onPressed,
    required this.iconData,
    this.iconSize = 36,
    this.iconColor = Colors.white,
    this.background = Colors.transparent,
    this.radius = 18,
    this.borderColor = Colors.white24,
    this.borderSize = 2,
  });

  final Function() onPressed;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final double radius;
  final Color background;
  final double borderSize;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: iconSize,maxHeight: iconSize),

        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: Border.all(color: borderColor, width: borderSize),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Icon(
            iconData,
            size: iconSize - 10,
            color: iconColor,

          ),
        ));
  }
}


