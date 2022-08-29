import 'package:flutter/material.dart';
import 'package:dice_roller/components/multiplier_controls.dart';
import 'package:dice_roller/components/number_display.dart';
import 'package:dice_roller/components/roll_button.dart';
import 'history_drawer.dart';
import 'package:dice_roller/components/buttons_dialer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
