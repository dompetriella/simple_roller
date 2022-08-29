import 'package:dice_roller/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:dice_roller/components/multiplier_controls.dart';
import 'package:dice_roller/components/number_display.dart';
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
      drawer: HistoryDrawer(),
      body: ListView(
        children: const [
          NumberDisplay(),
          RollButton(),
          MultiplierControls(),
          ButtonsDialer()
        ],
      ),
    );
  }
}
