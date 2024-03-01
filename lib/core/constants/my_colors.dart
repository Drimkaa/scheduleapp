import 'package:flutter/material.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  //
  const MyColors();

  final Color red =  const Color(0xffFF4C4C);
  final Color first = const Color(0xff00FFAA);
  final Color second = const Color(0xff00FFD5);
  final Color third = const Color(0xff3BF3FF);
  final Color fourth = const Color(0xff3BC4FF);
  final Color fifth = const Color(0xff3BADFF);
  final Color sixth = const Color(0xff3B7DFF);
  final Color firstD = const Color(0xff29B280);
  final Color secondD = const Color(0xff29B2A1);
  final Color thirdD = const Color(0xff29AAB2);
  final Color fourthD = const Color(0xff2989B2);
  final Color fifthD = const Color(0xff2979B2);
  final Color sixthD = const Color(0xff2957B2);
  final Color dark_1 = const Color(0xff141414);
  final Color dark_2 = const Color(0xff1C1C1C);
  final Color dark_3 = const Color(0xff262626);
  final Color dark_4 = const Color(0xff2D2D2D);
  @override
  ThemeExtension<MyColors> copyWith() => const MyColors();

  @override
  ThemeExtension<MyColors> lerp(ThemeExtension<MyColors>? other, double t) => (other is! MyColors) ? this : const MyColors();
}
