import 'package:flutter/material.dart';
import 'package:health_care/src/core/helpers/utils.dart';
import 'package:health_care/src/core/styles/colors_constant.dart';

abstract class AppTheme {
  // light.
  static ThemeData light() {
    return ThemeData(
      fontFamily: Utils.getFontFamily(),
      primaryColor: ColorsConstants.mainBlue,
      colorScheme: const ColorScheme.light(
        primary: ColorsConstants.mainBlue,
      ),
    );
  }

  // dark.
  static ThemeData dark() {
    return ThemeData(
      fontFamily: Utils.getFontFamily(),
      primaryColor: ColorsConstants.mainBlue,
      colorScheme: const ColorScheme.dark(
        primary: ColorsConstants.mainBlue,
      ),
    );
  }
}
