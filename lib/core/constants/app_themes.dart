import 'package:flutter/material.dart';
import 'my_colors.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xff141414),
  appBarTheme: const AppBarTheme(backgroundColor: Color(0xff262626)),
  textTheme: const TextTheme(
    titleSmall: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: 0, height: 0, fontFamily: "Jost"),
    titleMedium: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w500, fontSize: 16, fontFamily: "Jost"),
    titleLarge: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w400, fontSize: 22),
    //-----------------------------
    headlineSmall: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w500, height: 1, fontSize: 18, fontFamily: "Jost"),
    headlineMedium: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w500, height: 1, fontSize: 18, fontFamily: "Jost"),
    headlineLarge: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w400, height: 1, fontSize: 20, fontFamily: "Jost"),
    //-----------------------------
    labelSmall: TextStyle(color: Color(0xff345cef), fontSize: 12, height: 1, letterSpacing: 1, fontWeight: FontWeight.w300),
    labelMedium: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14, height: 1, letterSpacing: 0.4, fontWeight: FontWeight.w400),
    labelLarge: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18, height: 1, letterSpacing: 1, fontWeight: FontWeight.w500),
    //-----------------------------
    bodySmall: TextStyle(color: Color(0xFFFFFFFF), fontSize: 12, height: 1, fontWeight: FontWeight.w600, fontFamily: "Jost"),
    bodyMedium: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14, height: 1, letterSpacing: 1, fontWeight: FontWeight.w200, fontFamily: "Jost"),
    bodyLarge: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16, height: 1, letterSpacing: 1, fontWeight: FontWeight.w500, fontFamily: "Jost"),
  ),





  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedLabelStyle: TextStyle(
      color:  MyColors.first,
      fontSize: 12,
      height: 1,
      fontWeight: FontWeight.w400,
    ),
    unselectedLabelStyle: TextStyle(
      color:  MyColors.firstD,
      fontWeight: FontWeight.w300,
      fontSize: 12,
      height: 1,
    ),
    selectedIconTheme: IconThemeData(
      size: 24,

    ),
    unselectedIconTheme: IconThemeData(
      size: 24,

    ),

    selectedItemColor:  MyColors.first,
    unselectedItemColor:  MyColors.firstD,
    backgroundColor: MyColors.dark_3,
  ),
  extensions: <ThemeExtension<dynamic>>[const MyColors()],
);
