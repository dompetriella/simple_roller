import 'package:dice_roller/providers/theme_provider.dart';
import 'package:dice_roller/themes.dart';
import 'package:flutter/material.dart';
import 'package:dice_roller/components/drawer/themes_bar.dart';
import 'package:dice_roller/components/drawer/roll_history.dart';
import 'package:dice_roller/components/drawer/stats.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ScrollController themesScrollController = ScrollController();

class HistoryDrawer extends ConsumerWidget {
  const HistoryDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var drawerWidth = MediaQuery.of(context).size.width * .70;
    var drawerHeight = MediaQuery.of(context).size.height;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (themesScrollController.hasClients) {
        int index = 0;
        List<dynamic> themes = themesDictionary.values.toList();
        for (var i = 0; i < themesDictionary.length; i++) {
          if (ref.watch(themeProvider).themeName == themes[i].themeName) {
            index = i;
          }
        }
        themesScrollController.jumpTo(
          index * MediaQuery.of(context).size.height * 0.06 + (8 * index),
        );
      }
    });

    return Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * .80,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(
                      ref.watch(themeProvider).diceButtonBorderRadius)),
              color: ref.watch(themeProvider).drawerBg,
            ),
            child: SizedBox(
              height: drawerHeight,
              width: drawerWidth,
              child: Column(children: [
                ThemesBar(
                  scrollController: themesScrollController,
                ),
                RollHistoryBar(),
                StatsBar()
              ]),
            )),
        AccessibilityDrawerClose()
      ],
    );
  }
}

class AccessibilityDrawerClose extends StatelessWidget {
  const AccessibilityDrawerClose({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Close drawer',
      button: true,
      child: GestureDetector(
        child: SizedBox(
          height: 5,
          width: 5,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
