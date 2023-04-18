import 'package:dice_roller/providers/theme_provider.dart';
import 'package:dice_roller/themes.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/components/drawer/theme_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ThemesBar extends ConsumerWidget {
  const ThemesBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ThemesButton> themesButtonList = themesDictionary.values
        .map((e) => ThemesButton(
              appTheme: e,
            ))
        .toList();

    var screenHeight = MediaQuery.of(context).size.height;

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
            padding: getValueForScreenType(
                context: context,
                mobile: EdgeInsets.fromLTRB(8.0, 12, 12, 8),
                tablet: EdgeInsets.all(16)),
            child: Column(
              children: [
                Flexible(
                  flex: getValueForScreenType(
                      context: context, mobile: 4, tablet: 2),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Themes',
                          style: TextStyle(
                              fontSize: getValueForScreenType(
                                  context: context,
                                  mobile: 3.screenHeight,
                                  tablet: 30),
                              fontWeight: FontWeight.w900,
                              color: ref
                                  .watch(themeProvider)
                                  .drawerColumnTextColor),
                        ),
                        Text(ref.watch(themeProvider).themeName,
                            style: TextStyle(
                                fontSize: getValueForScreenType(
                                    context: context, mobile: 2.sh, tablet: 20),
                                color: ref
                                    .watch(themeProvider)
                                    .drawerColumnTextColor))
                      ],
                    ),
                  ),
                ),
                Flexible(
                    flex: getValueForScreenType(
                        context: context, mobile: 4, tablet: 3),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(
                                ref.watch(themeProvider).themeBarBorderRadius)),
                            color: ref.watch(themeProvider).drawerThemesBg,
                            boxShadow: [
                              ref.watch(themeProvider).columnShadow,
                              ref.watch(themeProvider).diceButtonOutline
                            ]),
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
