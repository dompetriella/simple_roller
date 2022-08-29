import 'package:dice_roller/models/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/themes.dart';

final themeProvider = Provider<AppTheme>((ref) {
  return lightTheme;
});
