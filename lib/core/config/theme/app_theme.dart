import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0XFF00B4CC);
  static const Color greyColor = Color(0XFF7C9094);
  static const Color scaffoldBackgroundColor = Color(0XFFF7F9FA);

  static ThemeData get light {
    return ThemeData(
      fontFamily: 'DMSans',
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: greyColor,
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          color: greyColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: greyColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: greyColor.withOpacity(0.3),
        thickness: 1,
        space: 0,
      ),
    );
  }
}
