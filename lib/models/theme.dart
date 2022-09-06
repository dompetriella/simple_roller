import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class AppTheme {
  final String themeName;
  final List<Color> themeColors;
  final Color bgColor;
  final BoxShadow innerShadow;
  final String fontFamily;

  final Color numberDisplayBgColor;
  final double numberDisplayBorderRadius;
  final BoxShadow? numberDisplayDropShadow;

  final Color diceIconTextColor;
  final Color diceIconBgColor;
  final double diceIconBorderRadius;

  final Color diceTypeBgColor;
  final Color diceTypeStrokeColor;
  final double diceTypeBorderRadius;

  final Color numberDisplayTextColor;

  final Color rollButtonBgColor;
  final Color rollButtonTextColor;
  final BoxShadow rollButtonOutline;

  final Color multiplierTextColor;
  final Color multiplierBgColor;
  final BoxShadow multiplierDropShadow;
  final BoxShadow multiplierOutline;

  final Color diceButtonBg;
  final Color diceButtonTextColor;
  final double diceButtonBorderRadius;
  final Color diceButtonInputTextColor;
  final Color diceButtonInputColorBg;
  final BoxShadow diceButtonInnerShadow;
  final BoxShadow diceButtonOutline;

  final Color drawerBg;
  final Color drawerNegativeSpace;
  final double drawerBorderRadius;
  final BoxShadow columnShadow;
  final Color drawerColumnBg;
  final Color drawerColumnContentBg;
  final Color drawerColumnTextColor;
  final Color drawerThemesBg;
  final Color drawerHistorySliverBg;
  final Color drawerHistorySliverTextColor;
  final BoxShadow drawerHistorySliverOutline;
  final Color drawerStatsIconBg;
  final Color drawerStatsColorBg;

  AppTheme(
      {required this.themeName,
      required this.themeColors,
      required this.bgColor,
      required this.numberDisplayBgColor,
      required this.diceIconBgColor,
      required this.diceTypeBgColor,
      required this.rollButtonBgColor,
      required this.multiplierTextColor,
      required this.diceButtonBg,
      required this.diceButtonInputColorBg,
      required this.drawerBg,
      required this.drawerColumnBg,
      required this.drawerColumnTextColor,
      required this.drawerHistorySliverBg,
      required this.drawerStatsIconBg,
      required this.drawerStatsColorBg,
      this.drawerThemesBg = Colors.white,
      this.drawerNegativeSpace = Colors.white,
      this.drawerBorderRadius = 20,
      this.drawerHistorySliverTextColor = Colors.black,
      this.drawerColumnContentBg = Colors.white,
      this.drawerHistorySliverOutline = const BoxShadow(
        color: Colors.white,
        spreadRadius: 2,
      ),
      this.innerShadow = const BoxShadow(
          inset: true,
          color: Color.fromRGBO(0, 0, 0, .50),
          blurRadius: 4,
          offset: Offset(0, -5)),
      this.columnShadow = const BoxShadow(
          inset: true,
          color: Color.fromRGBO(0, 0, 0, .50),
          blurRadius: 4,
          offset: Offset(4, 4)),
      this.diceButtonInnerShadow = const BoxShadow(
          inset: true,
          color: Color.fromRGBO(0, 0, 0, .50),
          blurRadius: 4,
          offset: Offset(0, -5)),
      this.diceButtonOutline = const BoxShadow(color: Colors.transparent),
      this.fontFamily = 'Helvetica',
      this.numberDisplayBorderRadius = 30,
      this.numberDisplayDropShadow,
      this.diceIconTextColor = Colors.white,
      this.diceIconBorderRadius = 5,
      this.diceTypeStrokeColor = Colors.white,
      this.diceTypeBorderRadius = 10,
      this.numberDisplayTextColor = Colors.black,
      this.rollButtonTextColor = Colors.white,
      this.rollButtonOutline = const BoxShadow(color: Colors.transparent),
      this.multiplierBgColor = Colors.white,
      this.multiplierDropShadow = const BoxShadow(
          inset: false,
          color: Color.fromRGBO(0, 0, 0, .50),
          blurRadius: 4,
          offset: Offset(0, 5)),
      this.multiplierOutline = const BoxShadow(),
      this.diceButtonTextColor = Colors.white,
      this.diceButtonBorderRadius = 20,
      this.diceButtonInputTextColor = Colors.black});
}
