import 'package:flutter/material.dart';

class AppTheme {
  final Color bgColor;
  final String fontFamily;

  final Color numberDisplayBgColor;
  final double numberDisplayBorderRadius;
  // final BoxShadow numberDisplayDropShadow;
  // final BoxShadow numberDisplayInnerShadow;

  final Color diceIconTextColor;
  final Color diceIconBgColor;
  final double diceIconBorderRadius;

  final Color diceTypeBgColor;
  final Color diceTypeStrokeColor;
  final double diceTypeBorderRadius;

  final Color numberDisplayTextColor;

  final Color rollButtonBgColor;
  final Color rollButtonTextColor;
  // final List<BoxShadow> rollButtonBoxShadow;

  final Color multiplierTextColor;
  final Color multiplierBgColor;
  // final BoxShadow multiplierBoxShadow;

  final Color diceButtonBg;
  final Color diceButtonTextColor;
  final double diceButtonBorderRadius;
  final Color diceButtonInputTextColor;
  final Color diceButtonInputColorBg;
  // final List<BoxShadow> diceButtonBoxShadow;

  AppTheme(
      {required this.bgColor,
      required this.numberDisplayBgColor,
      required this.diceIconBgColor,
      required this.diceTypeBgColor,
      required this.rollButtonBgColor,
      required this.multiplierTextColor,
      required this.diceButtonBg,
      required this.diceButtonInputColorBg,
      this.fontFamily = 'Helvetica',
      this.numberDisplayBorderRadius = 30,
      this.diceIconTextColor = Colors.white,
      this.diceIconBorderRadius = 30,
      this.diceTypeStrokeColor = Colors.white,
      this.diceTypeBorderRadius = 20,
      this.numberDisplayTextColor = Colors.black,
      this.rollButtonTextColor = Colors.white,
      this.multiplierBgColor = Colors.white,
      this.diceButtonTextColor = Colors.white,
      this.diceButtonBorderRadius = 20,
      this.diceButtonInputTextColor = Colors.black});
}
