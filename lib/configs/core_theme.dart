import 'package:flutter/material.dart';

import 'app_theme.dart';

const fontFamily = 'Roboto';

final themeLight = ThemeData(
  primarySwatch: Colors.teal,
  fontFamily: fontFamily,
  // accentColor: AppTheme.light.primary,
  primaryColor: AppTheme.light.primary,
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: AppTheme.light.primary,
        background: AppTheme.light.background,
      ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      side: BorderSide.none, // Loại bỏ viền
      borderRadius: BorderRadius.zero, // Loại bỏ viền bo
    ),
    elevation: 0, // Loại bỏ đổ bóng
  ),
);

final themeDark = ThemeData(
  fontFamily: fontFamily,
  primaryColor: AppTheme.light.primary,
  brightness: Brightness.dark,
  backgroundColor: Colors.grey[800],
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.grey[900],
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: AppTheme.light.primary,
        background: AppTheme.light.background,
        brightness: Brightness.dark,
      ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      side: BorderSide.none, // Loại bỏ viền
      borderRadius: BorderRadius.zero, // Loại bỏ viền bo
    ),
    elevation: 0, // Loại bỏ đổ bóng
  ),
);
