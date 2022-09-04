import 'package:dice_roller/providers/theme_provider.dart';
import 'package:dice_roller/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/components/drawer/drawer_themes_button.dart';

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
    ];

    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              color: ref.watch(themeProvider).drawerColumnBg,
              borderRadius: BorderRadius.all(Radius.circular(
                  ref.watch(themeProvider).drawerBorderRadius))),
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
                            borderRadius: BorderRadius.all(Radius.circular(
                                ref.watch(themeProvider).drawerBorderRadius)),
                            color: Colors.white,
                            boxShadow: [ref.watch(themeProvider).columnShadow]),
                        child: ListView.builder(
                            itemBuilder: ((context, index) {
                              return themesButtonList[
                                  index % themesButtonList.length];
                            }),
                            scrollDirection: Axis.horizontal)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
