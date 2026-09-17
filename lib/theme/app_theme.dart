import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF10121A);
  static const Color card = Color(0xFF191D29);
  static const Color primary = Color(0xFF7C5CFF);
  static const Color accent = Color(0xFFFFB84D);
  static const Color success = Color(0xFF4ADE80);
  static const Color danger = Color(0xFFFF6B6B);
  static const Color textSecondary = Color(0xFF9CA3AF);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: accent,
        surface: card,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: card,
        indicatorColor: primary.withOpacity(0.2),
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: card,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: textSecondary,
        ),
      ),
    );
  }
}