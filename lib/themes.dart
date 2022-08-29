import 'package:flutter/material.dart';
import 'package:dice_roller/models/theme.dart';

Color hex(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

var lightThemeBg = hex('AAC6C3');
var lightThemePrimary = hex('423B52');
var lightThemeSecondary = hex('D9D9D9');
var lightThemeAccent = hex('990000');

AppTheme lightTheme = AppTheme(
  bgColor: lightThemeBg,
  numberDisplayBgColor: lightThemeSecondary,
);
