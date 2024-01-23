import 'package:flutter/material.dart';

import 'app_core_theme.dart';
import 'color_palatte.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    primary: ColorPalette.primaryColor,
    primaryDark: ColorPalette.primaryColor,
    accent: ColorPalette.textWhiteColor,
    shadow: Colors.black.withOpacity(0.20),
    shadowSub: Colors.black.withOpacity(0.12),
    textSub: ColorPalette.textBlackColor,
  );

  static AppCoreTheme light = _core.copyWith(
    background: ColorPalette.backgroundColor,
    backgroundSub: ColorPalette.backgroundColor,
    scaffold: ColorPalette.backgroundColor,
    scaffoldDark: ColorPalette.backgroundColor,
    text: ColorPalette.textBlackColor,
    textSub2: Colors.black.withOpacity(0.25),
  );

  static AppCoreTheme dark = _core.copyWith(
    background: ColorPalette.backgroundColor,
    backgroundSub: ColorPalette.backgroundColor,
    scaffold: ColorPalette.backgroundColor,
    scaffoldDark: ColorPalette.backgroundColor,
    text: ColorPalette.textBlackColor,
    textSub2: Colors.black.withOpacity(0.25),
  );

  static AppCoreTheme? c;

  // Init
  static init(BuildContext context) {
    c = isDark(context) ? dark : light;
  }

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
