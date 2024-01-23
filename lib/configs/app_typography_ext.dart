import 'package:flutter/material.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension SuperTextStyles on TextStyle {
  TextStyle cl(Color color) {
    return copyWith(
      color: color,
    );
  }

  TextStyle s([double? size]) {
    return copyWith(
      fontSize: size ?? fontSize,
    );
  }

  TextStyle tsc([double multiplier = 1.0]) {
    return copyWith(
      fontSize: fontSize! * multiplier,
    );
  }

  TextStyle w(int i) {
    FontWeight w = FontWeight.w400;

    if (i == 3) {
      w = FontWeight.w300;
    }
    if (i == 5) {
      w = FontWeight.w500;
    }
    if (i == 6) {
      w = FontWeight.w600;
    }
    if (i == 7) {
      w = FontWeight.w700;
    }
    if (i == 9) {
      w = FontWeight.w900;
    }
    return copyWith(
      fontWeight: w,
    );
  }
}
