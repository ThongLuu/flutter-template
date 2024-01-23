import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color.fromRGBO(255, 184, 6, 1);
  static const Color dangerColor = Color.fromRGBO(255, 103, 6, 1);

  static const Color secondColor = Color.fromRGBO(255, 244, 231, 1);

  static const Color dividerColor = Color.fromRGBO(0, 0, 0, 0.2);

  static const Color textPrimaryColor = const Color.fromRGBO(255, 184, 6, 1);
  static const Color textBlackColor = Color(0xFF323B4B);
  static const Color textGrayColor = Color.fromRGBO(181, 181, 181, 1);
  static const Color textWhiteColor = Color.fromRGBO(255, 255, 255, 1);

  static const Color subTitleColor = Color(0xFF838383);

  // static const Color backgroundColor = Color.fromRGBO(255, 244, 231, 1);
  static const Color backgroundColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color transparent = Colors.transparent;
}

class Gradients {
  static const Gradient defaultGradientBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      ColorPalette.secondColor,
      ColorPalette.primaryColor,
    ],
  );

  static const buttonYellowGradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
    colors: [
      Color.fromRGBO(255, 203, 73, 1),
      Color.fromRGBO(255, 168, 0, 1),
    ],
  );
  static const buttonRedGradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
    colors: [
      Color.fromRGBO(255, 103, 73, 1),
      Color.fromRGBO(255, 108, 0, 1),
    ],
  );
  static const buttonGrayGradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.7, 1.0],
    colors: [
      Color.fromRGBO(221, 221, 221, 1),
      Color.fromRGBO(192, 192, 192, 1),
      Color.fromRGBO(154, 154, 154, 1),
    ],
  );
  static const buttonBlackGradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.7, 1.0],
    colors: [
      Color.fromRGBO(160, 160, 160, 1),
      Color.fromRGBO(128, 128, 128, 1),
      Color.fromRGBO(81, 81, 81, 1),
    ],
  );
  static const buttonGreenGradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
    colors: [
      Color.fromRGBO(0, 167, 44, 1),
      Color.fromRGBO(19, 121, 57, 1),
    ],
  );

  static const homeBlackGradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.7, 1.0],
    colors: [
      Color.fromRGBO(211, 211, 211, 1),
      Color.fromRGBO(192, 192, 192, 1),
      Color.fromRGBO(154, 154, 154, 1),
    ],
  );
}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
