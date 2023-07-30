import 'package:flutter/material.dart';
import 'package:portfolio/generated/fonts.gen.dart';
import 'package:portfolio/src/common/theme/text_theme_interfaces.dart';

extension HomeStyle on TextThemeFactory {
  TextStyle get title => displaySmall.copyWith(
        fontWeight: FontWeight.bold,
        fontFamily: FontFamily.visueltPro,
        height: 1.5,
      );

  TextStyle get description => regular.copyWith(
    fontFamily: FontFamily.visueltPro,
    height: 1.5,
  );

  TextStyle get seeMyWorks => bold.copyWith(
    fontFamily: FontFamily.visueltPro,
    height: 1.5,
  );

  TextStyle get menuActive => bodySmall.copyWith(
    fontWeight: FontWeight.bold,
    fontFamily: FontFamily.visueltPro,
    height: 1.5,
  );

  TextStyle get menu => bodySmall.copyWith(
    fontFamily: FontFamily.visueltPro,
    height: 1.5,
  );
}
