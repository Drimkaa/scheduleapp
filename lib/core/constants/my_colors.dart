import 'package:flutter/material.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors();

  static const Color red = Color(0xffFF4C4C);
  static const Color first = Color(0xff00FFAA);
  static const Color second = Color(0xff00FFD5);
  static const Color third = Color(0xff3BF3FF);
  static const Color fourth = Color(0xff3BC4FF);
  static const Color fifth = Color(0xff3BADFF);
  static const Color sixth = Color(0xff3B7DFF);
  static const Color firstD = Color(0xff29B280);
  static const Color secondD = Color(0xff29B2A1);
  static const Color thirdD = Color(0xff29AAB2);
  static const Color fourthD = Color(0xff2989B2);
  static const Color fifthD = Color(0xff2979B2);
  static const Color sixthD = Color(0xff2957B2);
  static const Color dark_1 = Color(0xff141414);
  static const Color dark_2 = Color(0xff1C1C1C);
  static const Color dark_3 = Color(0xff262626);
  static const Color dark_4 = Color(0xff2D2D2D);

  @override
  ThemeExtension<MyColors> copyWith() => const MyColors();

  @override
  ThemeExtension<MyColors> lerp(ThemeExtension<MyColors>? other, double t) =>
      (other is! MyColors) ? this : const MyColors();
}
