import 'package:dice_roller/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:dice_roller/components/drawer/drawer_themes_bar.dart';
import 'package:dice_roller/components/drawer/drawer_roll_history.dart';
import 'package:dice_roller/components/drawer/drawer_stats.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryDrawer extends ConsumerWidget {
  const HistoryDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var drawerWidth = MediaQuery.of(context).size.width * .70;
    var drawerHeight = MediaQuery.of(context).size.height;
    return Container(
        width: MediaQuery.of(context).size.width * .80,
        height: MediaQuery.of(context).size.height,
        color: ref.watch(themeProvider).drawerBg,
        child: Container(
          height: drawerHeight,
          width: drawerWidth,
          child: Column(children: [ThemesBar(), RollHistoryBar(), StatsBar()]),
        ));
  }
}
