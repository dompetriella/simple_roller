import 'package:flutter/material.dart';
import 'package:dice_roller/models/theme.dart';

Color hex(String code) {
  String colorString = '0xFF' + code;
  return Color(int.parse(colorString));
}

// light blue
var lightThemeBg = hex('AAC6C3');
// purple
var lightThemePrimary = hex('423B52');
// grey
var lightThemeSecondary = hex('D9D9D9');
// red
var lightThemeAccent = hex('990000');

AppTheme lightTheme = AppTheme(
    bgColor: lightThemeBg,
    numberDisplayBgColor: lightThemeSecondary,
    diceIconBgColor: lightThemePrimary,
    diceTypeBgColor: lightThemePrimary,
    rollButtonBgColor: lightThemeAccent,
    multiplierTextColor: lightThemePrimary,
    diceButtonBg: lightThemePrimary,
    diceButtonInputColorBg: Colors.white);
