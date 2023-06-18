import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = const Color(0xFF242424);
  static Color whiteColor = Colors.white;
  static Color goldPrimary = const Color(0xFFB7935F);
  static Color redColor = const Color(0xFFD73131);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
            color: blackColor
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor:whiteColor,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w900,
        color: blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w900,
        color: redColor,
      ),
    ),
  );
 // static ThemeData darkTheme = ThemeData();
}
