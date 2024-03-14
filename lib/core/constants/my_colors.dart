import 'package:flutter/material.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors();

  static const Color red = const Color(0xffFF4C4C);
  static const Color first = const Color(0xff00FFAA);
  static const Color second = const Color(0xff00FFD5);
  static const Color third = const Color(0xff3BF3FF);
  static const Color fourth = const Color(0xff3BC4FF);
  static const Color fifth = const Color(0xff3BADFF);
  static const Color sixth = const Color(0xff3B7DFF);
  static const Color firstD = const Color(0xff29B280);
  static const Color secondD = const Color(0xff29B2A1);
  static const Color thirdD = const Color(0xff29AAB2);
  static const Color fourthD = const Color(0xff2989B2);
  static const Color fifthD = const Color(0xff2979B2);
  static const Color sixthD = const Color(0xff2957B2);
  static const Color dark_1 = const Color(0xff141414);
  static const Color dark_2 = const Color(0xff1C1C1C);
  static const Color dark_3 = const Color(0xff262626);
  static const Color dark_4 = const Color(0xff2D2D2D);

  @override
  ThemeExtension<MyColors> copyWith() => const MyColors();

  @override
  ThemeExtension<MyColors> lerp(ThemeExtension<MyColors>? other, double t) =>
      (other is! MyColors) ? this : const MyColors();
}
