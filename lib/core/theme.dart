import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bg = Color(0xFF12141A);
  static const surface = Color(0xFF1C1F27);
  static const surface2 = Color(0xFF252936);
  static const text = Color(0xFFF2F3F7);
  static const muted = Color(0xFF9AA1B2);
  static const accent = Color(0xFFFF7A2F);
  static const onAccent = Color(0xFF1A1208);
}

ThemeData buildDarkTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accent,
      onPrimary: AppColors.onAccent,
      surface: AppColors.surface,
      onSurface: AppColors.text,
    ),
    textTheme: base.textTheme.apply(
      bodyColor: AppColors.text,
      displayColor: AppColors.text,
    ),
  );
}