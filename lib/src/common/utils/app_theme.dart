import 'package:flutter/material.dart';

import '../../../generated/fonts.gen.dart';

class AppTheme {

  static TextTheme get textTheme => const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 36,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.monoLisa,
      ),
    titleLarge: TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.monoLisa,
    ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.monoLisa,
      )
  );

  static ThemeData themeData = ThemeData(
    textTheme: textTheme,
  );
}
