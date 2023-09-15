import 'package:dice_roller/providers/theme_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/models/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemesButton extends ConsumerWidget {
  final AppTheme appTheme;
  const ThemesButton({Key? key, required this.appTheme}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Expanded> generateButtonColors() {
      return appTheme.themeColors.map<Expanded>((color) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: color,
                boxShadow: [ref.watch(themeProvider).innerShadow]),
          ),
        );
      }).toList();
    }

    Future saveThemeToPreferences() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('theme', ref.read(themeProvider).themeName);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 2, 3, 2),
      child: Center(
          child: Semantics(
        onDidGainAccessibilityFocus: () {
          Scrollable.ensureVisible(context);
        },
        button: true,
        label: 'Change Theme: ${appTheme.themeName}',
        child: GestureDetector(
          onTap: () => {
            ref.watch(themeProvider.notifier).state = appTheme,
            saveThemeToPreferences()
          },
          child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.height * 0.06,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                boxShadow: [
                  if (ref.watch(themeProvider.notifier).state == appTheme)
                    BoxShadow(
                        color: ref.watch(themeProvider).rollButtonBgColor,
                        offset: const Offset(0, 0),
                        blurRadius: 5,
                        spreadRadius: 2)
                ],
                borderRadius: const BorderRadius.all(Radius.circular(100)),
              ),
              child: Row(children: generateButtonColors())),
        ),
      )),
    );
  }
}
