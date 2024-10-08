import 'package:flutter/material.dart';

import 'theme_switcher_clipper.dart';

@immutable
class ThemeSwitcherClipperBridge extends CustomClipper<Rect> {
  const ThemeSwitcherClipperBridge({required this.sizeRate, required this.offset, required this.clipper});

  final double sizeRate;
  final Offset offset;
  final ThemeSwitcherClipper clipper;

  @override
  Rect getClip(Size size) {
    return clipper.getClip(size, offset, sizeRate);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return clipper.shouldReclip(oldClipper, offset, sizeRate);
  }
}
