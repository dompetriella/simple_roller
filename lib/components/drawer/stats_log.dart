import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:dice_roller/models/rolledDice.dart';

class StatsLog extends ConsumerWidget {
  final String diceValue;
  StatsLog({Key? key, required this.diceValue}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double buttonHeight = 80;
    double buttonWidth = 80;

    StateProvider<StatsDice> chosenDice() {
      switch (diceValue) {
        case '20':
          return d20Stats;
        case '4':
          return d4Stats;
        case '6':
          return d6Stats;
        case '10':
          return d10Stats;
        case '12':
          return d12Stats;
        case '100':
          return d100Stats;
        default:
          return d20Stats;
      }
    }

    var thisDieProvider = chosenDice();

    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 0, 4, 0),
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
            color: ref.watch(themeProvider).diceButtonBg,
            borderRadius: BorderRadius.all(Radius.circular(
                ref.watch(themeProvider).diceButtonBorderRadius)),
            boxShadow: [
              ref.watch(themeProvider).diceButtonOutline,
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'D$diceValue',
                style: TextStyle(
                    color: ref.watch(themeProvider).diceButtonTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                'Rolls: ${ref.watch(thisDieProvider).times}',
                style: TextStyle(
                  color: ref.watch(themeProvider).diceButtonTextColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                'Avg: ${double.parse((ref.watch(thisDieProvider).average).toStringAsFixed(1))}',
                style: TextStyle(
                  color: ref.watch(themeProvider).diceButtonTextColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}