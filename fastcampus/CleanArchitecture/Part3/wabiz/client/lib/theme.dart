import 'package:flutter/material.dart';

final ThemeData wabizDefaultTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  fontFamily: 'Pretendard',
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.black,
    unselectedItemColor: AppColors.wabizGary,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.black,
    surfaceTintColor: AppColors.white,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      side: BorderSide(color: AppColors.wabizGary[200]!),
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      textStyle: TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      minimumSize: Size(64, 50),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.wabizGary[200]!, width: 1.0),
    ),
    outlineBorder: BorderSide(color: AppColors.primary),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.primary, width: 1.0),
    ),
    hintStyle: TextStyle(
      fontSize: 16,
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w500,
      color: AppColors.wabizGary[400]!,
    ),
  ),
  dialogTheme: DialogThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);

class AppColors extends Color {
  AppColors(super.value);

  static const Color scaffoldBackgroundColor = Color(0xFFF2F4F6);
  static const Color primary = Color(0xFF03C3C4);
  static const Color secondary = Color(0xFFE2F9F9);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color bg = Color(0xFFF2F2F7);
  static const Color newBg = Color(0xFFF2F4F6);

  static const int _grayPrimaryValue = 0xFF848487;

  static const MaterialColor wabizGary =
      MaterialColor(_grayPrimaryValue, <int, Color>{
        50: Color(0xFFFEFBEE),
        100: Color(0xFFE5E5EA),
        200: Color(0xFFD4D4D4),
        300: Color(0xFFAEAEB2),
        400: Color(0xFF8E8E93),
        500: Color(0xFF848487),
        600: Color(0xFF636366),
        700: Color(0xFF4A4A4A),
        800: Color(0xFF303030),
        900: Color(0xFF242424),
      });
}
