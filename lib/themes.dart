import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:dice_roller/models/theme.dart';

Color hex(String code) {
  String colorString = '0xFF' + code;
  return Color(int.parse(colorString));
}

// light blue
var daylightBg = hex('AAC6C3');
// purple
var daylightPrimary = hex('423B52');
// grey
var daylightSecondary = hex('D9D9D9');
// red
var daylightAccent = hex('990000');

AppTheme daylight = AppTheme(
  themeName: "Daylight",
  themeColors: [hex('423B52'), hex('AAC6C3'), hex('D9D9D9'), hex('990000')],
  bgColor: daylightBg,
  numberDisplayBgColor: daylightSecondary,
  diceIconBgColor: daylightPrimary,
  diceTypeBgColor: daylightPrimary,
  rollButtonBgColor: daylightAccent,
  multiplierTextColor: daylightPrimary,
  diceButtonBg: daylightPrimary,
  diceButtonInputColorBg: Colors.white,
  drawerBg: daylightPrimary,
  drawerColumnBg: daylightBg,
  drawerColumnTextColor: Colors.black,
  drawerHistorySliverBg: daylightSecondary,
  drawerStatsIconBg: daylightPrimary,
  drawerStatsColorBg: Colors.white,
);

AppTheme twilight = AppTheme(
    themeName: "Twilight",
    themeColors: [Colors.black, daylightSecondary, Colors.white, hex('DB893D')],
    bgColor: Colors.black,
    numberDisplayBgColor: daylightSecondary,
    diceIconBgColor: Colors.black,
    diceTypeBgColor: Colors.black,
    rollButtonBgColor: hex('DB893D'),
    multiplierTextColor: Colors.black,
    diceButtonBg: daylightSecondary,
    diceButtonInputColorBg: Colors.white,
    drawerBg: daylightSecondary,
    drawerColumnBg: Colors.black,
    drawerColumnContentBg: Colors.black,
    drawerColumnTextColor: Colors.white,
    drawerHistorySliverBg: Colors.black,
    drawerStatsIconBg: Colors.black,
    drawerStatsColorBg: Colors.white,
    rollButtonTextColor: Colors.black,
    diceButtonTextColor: Colors.black,
    diceButtonInputTextColor: Colors.black,
    multiplierBgColor: daylightSecondary);

AppTheme midnight = AppTheme(
    themeName: "Midnight",
    themeColors: [
      Colors.black,
      Colors.white,
    ],
    bgColor: Colors.black,
    numberDisplayBgColor: Colors.black,
    diceIconBgColor: Colors.black,
    diceTypeBgColor: Colors.black,
    diceTypeStrokeColor: Colors.white,
    diceIconTextColor: Colors.white,
    numberDisplayTextColor: Colors.white,
    rollButtonBgColor: Colors.white,
    rollButtonTextColor: Colors.black,
    multiplierTextColor: Colors.white,
    multiplierOutline: BoxShadow(color: Colors.white, spreadRadius: 1),
    diceButtonBg: Colors.black,
    diceButtonOutline: const BoxShadow(color: Colors.white, spreadRadius: 1),
    diceButtonInnerShadow:
        const BoxShadow(color: Colors.white, blurRadius: 25, inset: true),
    diceButtonInputColorBg: Colors.black,
    drawerBg: Colors.black,
    drawerColumnBg: Colors.black,
    drawerColumnContentBg: Colors.black,
    drawerColumnTextColor: Colors.white,
    drawerThemesBg: Colors.black,
    drawerHistorySliverBg: Colors.white,
    drawerHistorySliverTextColor: Colors.white,
    drawerStatsIconBg: Colors.black,
    drawerStatsColorBg: Colors.black,
    diceButtonTextColor: Colors.white,
    diceButtonInputTextColor: Colors.black,
    multiplierBgColor: Colors.black);

var verdantBg = hex('1C4A1B');
var verdantPrimary = hex('3B8E39');
var verdantSecondary = hex('BDEEAC');
var verdantAccent = hex('50B5B5');

AppTheme verdant = AppTheme(
  themeName: "Verdant",
  themeColors: [verdantBg, verdantPrimary, verdantSecondary, verdantAccent],
  bgColor: verdantBg,
  numberDisplayBgColor: verdantSecondary,
  numberDisplayTextColor: verdantBg,
  diceIconBgColor: verdantPrimary,
  diceTypeBgColor: verdantPrimary,
  rollButtonBgColor: verdantAccent,
  multiplierTextColor: verdantBg,
  diceButtonBg: verdantPrimary,
  diceButtonInputColorBg: verdantSecondary,
  drawerBg: verdantPrimary,
  drawerColumnBg: verdantBg,
  drawerColumnTextColor: Colors.white,
  drawerHistorySliverBg: verdantSecondary,
  drawerStatsIconBg: verdantPrimary,
  drawerStatsColorBg: Colors.white,
);

var glacierBg = hex('1B073D');
var glacierPrimary = hex('2A4ABB');
var glacierSecondary = hex('ADF3F3');
var glacierAccent = hex('895AC5');

AppTheme glacier = AppTheme(
  themeName: "Glacier",
  themeColors: [glacierBg, glacierPrimary, glacierSecondary, glacierAccent],
  bgColor: glacierBg,
  numberDisplayBgColor: glacierSecondary,
  numberDisplayTextColor: glacierBg,
  diceIconBgColor: glacierPrimary,
  diceTypeBgColor: glacierPrimary,
  rollButtonBgColor: glacierAccent,
  multiplierTextColor: glacierBg,
  diceButtonBg: glacierPrimary,
  diceButtonInputColorBg: glacierSecondary,
  drawerBg: glacierPrimary,
  drawerColumnBg: glacierBg,
  drawerColumnTextColor: Colors.white,
  drawerHistorySliverBg: glacierSecondary,
  drawerStatsIconBg: glacierPrimary,
  drawerStatsColorBg: Colors.white,
);

var fireballBg = hex('401717');
var fireballPrimary = hex('CA6821');
var fireballSecondary = hex('F1F99E');
var fireballAccent = hex('F93535');

AppTheme fireball = AppTheme(
  themeName: "Fireball",
  themeColors: [fireballBg, fireballPrimary, fireballSecondary, fireballAccent],
  bgColor: fireballBg,
  numberDisplayBgColor: fireballSecondary,
  numberDisplayTextColor: fireballBg,
  diceIconBgColor: fireballPrimary,
  diceTypeBgColor: fireballPrimary,
  rollButtonBgColor: fireballAccent,
  multiplierTextColor: fireballBg,
  diceButtonBg: fireballPrimary,
  diceButtonInputColorBg: fireballSecondary,
  drawerBg: fireballPrimary,
  drawerColumnBg: fireballBg,
  drawerColumnTextColor: Colors.white,
  drawerHistorySliverBg: fireballSecondary,
  drawerStatsIconBg: fireballPrimary,
  drawerStatsColorBg: Colors.white,
);

var obeliskPrimary = hex('515151');
var obeliskSecondary = daylightSecondary;
var obeliskBg = hex('888888');
var obeliskAccent = hex('28272F');

AppTheme obelisk = AppTheme(
  themeName: "Obelisk",
  themeColors: [obeliskAccent, obeliskPrimary, obeliskBg, obeliskSecondary],
  bgColor: obeliskBg,
  numberDisplayBgColor: obeliskSecondary,
  diceIconBgColor: obeliskPrimary,
  diceTypeBgColor: obeliskPrimary,
  rollButtonBgColor: obeliskAccent,
  multiplierTextColor: obeliskPrimary,
  diceButtonBg: obeliskPrimary,
  diceButtonInputColorBg: Colors.white,
  drawerBg: obeliskPrimary,
  drawerColumnBg: obeliskBg,
  drawerColumnTextColor: Colors.black,
  drawerHistorySliverBg: obeliskSecondary,
  drawerStatsIconBg: obeliskPrimary,
  drawerStatsColorBg: Colors.white,
);
