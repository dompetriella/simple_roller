import 'package:flutter/material.dart';

Color hex(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class AppTheme {
  final Color bgColor;
  final String fontFamily;

  final Color numberDisplayBgColor;
  final int numberDisplayBorderRadius;
  // final BoxShadow numberDisplayDropShadow;
  // final BoxShadow numberDisplayInnerShadow;

  // final Color diceIconTextColor;
  // final Color diceIconBgColor;
  // final int diceIconBorderRadius;

  // final Color diceTypeBgColor;
  // final Color diceTypeStrokeColor;
  // final int diceTypeBorderRadius;

  // final Color numberDisplayTextColor;

  // final Color rollButtonBgColor;
  // final Color rollButtonTextColor;
  // final List<BoxShadow> rollButtonBoxShadow;

  // final Color multiplierTextColor;
  // final Color multiplierBgColor;
  // final BoxShadow multiplierBoxShadow;

  // final Color diceButtonBg;
  // final Color diceButtonTextColor;
  // final int diceButtonBorderRadius;
  // final List<BoxShadow> diceButtonBoxShadow;
  // final Color diceButtonInputColor;

  AppTheme({
    required this.bgColor,
    required this.numberDisplayBgColor,
    this.fontFamily = 'Helvetica',
    this.numberDisplayBorderRadius = 30,
  });
}
