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
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: greyColor.withOpacity(0.3),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 15,
        enableFeedback: false,
        selectedLabelStyle: TextStyle(
          color: primaryColor,
          fontSize: 10,
        ),
        unselectedLabelStyle: TextStyle(
          color: greyColor,
          fontSize: 10,
        ),
        selectedIconTheme: IconThemeData(
          size: 25.0,
          color: primaryColor,
        ),
        unselectedIconTheme: IconThemeData(
          size: 25.0,
          color: greyColor,
        ),
        type: BottomNavigationBarType.fixed,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
