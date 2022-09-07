import 'package:dice_roller/providers/theme_provider.dart';
import 'package:dice_roller/themes.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/components/drawer/theme_button.dart';

class ThemesBar extends ConsumerWidget {
  const ThemesBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ThemesButton> themesButtonList = [
      ThemesButton(appTheme: daylight),
      ThemesButton(appTheme: twilight),
      ThemesButton(appTheme: midnight),
      ThemesButton(appTheme: verdant),
      ThemesButton(appTheme: glacier),
      ThemesButton(appTheme: fireball),
      ThemesButton(appTheme: obelisk),
      ThemesButton(appTheme: abyssal),
      ThemesButton(appTheme: faerie)
    ];

    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              color: ref.watch(themeProvider).drawerColumnBg,
              borderRadius: BorderRadius.all(
                  Radius.circular(ref.watch(themeProvider).drawerBorderRadius)),
              boxShadow: [ref.watch(themeProvider).innerShadow]),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 12, 12, 8),
            child: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Themes',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: ref
                                    .watch(themeProvider)
                                    .drawerColumnTextColor),
                          ),
                          Text(ref.watch(themeProvider).themeName,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ref
                                      .watch(themeProvider)
                                      .drawerColumnTextColor))
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                    flex: 6,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: ref.watch(themeProvider).drawerThemesBg,
                            boxShadow: [
                              ref.watch(themeProvider).columnShadow,
                              ref.watch(themeProvider).diceButtonOutline
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6.0, 2, 6, 2),
                          child: ListView.builder(
                              itemBuilder: ((context, index) {
                                return themesButtonList[
                                    index % themesButtonList.length];
                              }),
                              scrollDirection: Axis.horizontal),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
