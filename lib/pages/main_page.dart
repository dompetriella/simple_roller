import 'dart:async';

import 'package:dice_roller/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:dice_roller/components/multiplier_controls.dart';
import 'package:dice_roller/components/display.dart';
import 'package:dice_roller/components/roll_button.dart';
import 'history_drawer.dart';
import 'package:dice_roller/components/buttons_dialer.dart';
import 'package:dice_roller/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ref.watch(themeProvider).bgColor,
      endDrawer: HistoryDrawer(),
      body: Builder(builder: (context) {
        return GestureDetector(
          onPanUpdate: (swipe) {
            if (swipe.delta.dx < 0) {
              Scaffold.of(context).openDrawer();
            }
          },
          child: ListView(
            children: const [
              Display(),
              RollButton(),
              MultiplierControls(),
              ButtonsDialer()
            ],
          ),
        );
      }),
    );
  }
}
