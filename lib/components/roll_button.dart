import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:dice_roller/models/rolledDice.dart';
import 'dart:math';

class RollButton extends ConsumerWidget {
  const RollButton({Key? key}) : super(key: key);

  int randomInt(int min, int max) {
    var randomInt = min + Random.secure().nextInt((max + 1) - min);
    return randomInt;
  }

  List<RolledDice> createRolledDiceList(WidgetRef ref) {
    List<RolledDice> rolledDiceList = [];
    for (var i = 0; i < ref.read(multiplierProvider); i++) {
      RolledDice die = RolledDice(
          rollValue: randomInt(1, ref.read(selectedDiceProvider)),
          diceValue: ref.read(selectedDiceProvider));
      rolledDiceList.add(die);
    }
    return rolledDiceList;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      child: GestureDetector(
        onTap: () {
          ref
              .read(rollHistoryProvider.notifier)
              .addRoll(createRolledDiceList(ref));
        },
        child: Container(
          width: screenWidth,
          height: screenHeight * .1,
          decoration: BoxDecoration(
              color: ref.watch(themeProvider).rollButtonBgColor,
              borderRadius: BorderRadius.all(Radius.circular(
                  ref.watch(themeProvider).numberDisplayBorderRadius)),
              boxShadow: [
                ref.watch(themeProvider).innerShadow,
                ref.watch(themeProvider).rollButtonOutline
              ]),
          child: Center(
              child: Text(
            "ROLL",
            style: TextStyle(
                fontSize: 50,
                color: ref.watch(themeProvider).rollButtonTextColor,
                fontWeight: FontWeight.w900),
          )),
        ),
      ),
    );
  }
}
