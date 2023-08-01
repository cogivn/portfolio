import 'package:flutter/material.dart';

import '../../../../../generated/fonts.gen.dart';
import '../../../../common/theme/text_theme_interfaces.dart';

extension AboutStyle on TextThemeFactory{

  TextStyle get aboutTitle => displaySmall.copyWith(
    fontWeight: FontWeight.bold,
    fontFamily: FontFamily.visueltPro,
    height: 1.5,
  );

  TextStyle get content => regular.copyWith(
    fontFamily: FontFamily.visueltPro,
    height: 1.5,
  );
}