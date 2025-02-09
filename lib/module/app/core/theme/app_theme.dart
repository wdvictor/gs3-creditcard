import 'package:flutter/material.dart';

class AppTheme {
  static String get primaryFontFamily => 'Rawline';
  static Color get lightBlue => const Color(0xFF4470B5);
  static Color get mediumBlue => const Color(0xFF2C6CBF);
  static Color get darkBlue => const Color(0xFF153259);
  static Color get backgroundColor => const Color(0xFFF2F2F2);

  static Color get primaryText => const Color(0xFF383838);
  static Color get secondaryText => const Color(0xFF3E4041);
  static Color get terciaryText => const Color(0xFF717577);

  static double get spacingLg => 4;
  static double get spacingMd => 3;
  static double get spacingXs => 1;
  static double get spacingXxs => 0.5;

  static TextTheme get textTheme => TextTheme(
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: terciaryText,
          fontFamily: 'Rawline',
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          fontFamily: primaryFontFamily,
          color: secondaryText,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: primaryFontFamily,
          color: terciaryText,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: primaryFontFamily,
          color: primaryText,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: primaryFontFamily,
          color: secondaryText,
        ),
      );

  static double get iconButton => 24;
}
