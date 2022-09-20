import 'package:dice_roller/models/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/themes.dart';

final themeProvider = StateProvider<AppTheme>((ref) {
  return themesDictionary['Daylight'] ?? defaultTheme;
});
