// File: app_theme.dart

import 'package:flutter/material.dart';

class ThemeConstant {
  static const primaryColor = Color.fromARGB(255, 17, 119, 20);
  static const darkPrimaryColor = Color(0xFF1A237E); // Example color
  static const secondaryColor = Color(0xFFFFC107); // Example color
  static const appBarColor = Color(0xFF4CAF50);
  static const darkAppBarColor = Color(0xFF303030); // Example dark color
  static const darkBottomNavBarColor = Color(0xFF424242); // Example dark color
}

class AppTheme {
  static bool isDarkMode = false; // Track the current theme mode

  static ThemeData getApplicationTheme(bool bool) {
    return getTheme(isDarkMode);
  }

  static ThemeData getTheme(bool isDark) {
    return ThemeData(
      colorScheme: isDark
          ? const ColorScheme.dark(
              primary: ThemeConstant.darkPrimaryColor,
              secondary: ThemeConstant.secondaryColor,
            )
          : const ColorScheme.light(
              primary: ThemeConstant.primaryColor,
              secondary: ThemeConstant.secondaryColor,
            ),
      brightness: isDark ? Brightness.dark : Brightness.light,
      fontFamily: 'Montserrat',
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor:
            isDark ? ThemeConstant.darkAppBarColor : ThemeConstant.appBarColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 20,
        ),
      ),
      // Add more theme properties as needed...
    );
  }

  static void toggleTheme() {
    isDarkMode = !isDarkMode; // Toggle the theme mode
  }
}
