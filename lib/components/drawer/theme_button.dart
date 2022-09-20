import 'package:dice_roller/providers/theme_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/models/theme.dart';

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

    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 2, 3, 2),
      child: Center(
          child: GestureDetector(
        onTap: () => ref.watch(themeProvider.notifier).state = appTheme,
        child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.height * 0.06,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              boxShadow: [
                if (ref.watch(themeProvider.notifier).state == appTheme)
                  BoxShadow(
                      color: ref.watch(themeProvider).rollButtonBgColor,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                      spreadRadius: 2)
              ],
              borderRadius: BorderRadius.all(
                  Radius.circular(ref.watch(themeProvider).drawerBorderRadius)),
            ),
            child: Row(children: generateButtonColors())),
      )),
    );
  }
}
