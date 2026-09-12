import 'package:flutter/material.dart';

class AppTheme{
  static const Color primary=Color(0xFFE2BE7F);
  static const Color black=Color(0xFF202020);
  static const Color white=Color(0xFFFFFFFF);

  static ThemeData lightTheme=ThemeData();
  static ThemeData darkTheme =ThemeData(
    primaryColor: primary,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(fontSize: 16,
      fontWeight: FontWeight.bold,
      color: white),
      titleLarge: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold,
          color: white),
      titleSmall: TextStyle(fontSize: 14,
          fontWeight: FontWeight.bold,
          color: white),
      headlineSmall: TextStyle(fontSize: 24,
          fontWeight: FontWeight.bold,
          color: white),
    )
  );
}
