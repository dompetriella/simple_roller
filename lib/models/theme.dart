import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class AppTheme {
  final Color bgColor;
  final List<BoxShadow> innerShadow;
  final String fontFamily;

  final Color numberDisplayBgColor;
  final double numberDisplayBorderRadius;
  final List<BoxShadow> numberDisplayDropShadow;

  final Color diceIconTextColor;
  final Color diceIconBgColor;
  final double diceIconBorderRadius;

  final Color diceTypeBgColor;
  final Color diceTypeStrokeColor;
  final double diceTypeBorderRadius;

  final Color numberDisplayTextColor;

  final Color rollButtonBgColor;
  final Color rollButtonTextColor;

  final Color multiplierTextColor;
  final Color multiplierBgColor;
  final List<BoxShadow> multiplierDropShadow;

  final Color diceButtonBg;
  final Color diceButtonTextColor;
  final double diceButtonBorderRadius;
  final Color diceButtonInputTextColor;
  final Color diceButtonInputColorBg;

  AppTheme(
      {required this.bgColor,
      required this.numberDisplayBgColor,
      required this.diceIconBgColor,
      required this.diceTypeBgColor,
      required this.rollButtonBgColor,
      required this.multiplierTextColor,
      required this.diceButtonBg,
      required this.diceButtonInputColorBg,
      this.innerShadow = const [
        BoxShadow(
            inset: true,
            color: Color.fromRGBO(0, 0, 0, .50),
            blurRadius: 4,
            offset: Offset(0, -5))
      ],
      this.fontFamily = 'Helvetica',
      this.numberDisplayBorderRadius = 30,
      this.numberDisplayDropShadow = const [],
      this.diceIconTextColor = Colors.white,
      this.diceIconBorderRadius = 5,
      this.diceTypeStrokeColor = Colors.white,
      this.diceTypeBorderRadius = 10,
      this.numberDisplayTextColor = Colors.black,
      this.rollButtonTextColor = Colors.white,
      this.multiplierBgColor = Colors.white,
      this.multiplierDropShadow = const [
        BoxShadow(
            inset: false,
            color: Color.fromRGBO(0, 0, 0, .50),
            blurRadius: 4,
            offset: Offset(0, 5))
      ],
      this.diceButtonTextColor = Colors.white,
      this.diceButtonBorderRadius = 20,
      this.diceButtonInputTextColor = Colors.black});
}
