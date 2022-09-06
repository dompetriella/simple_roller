import 'package:dice_roller/components/rolled_dice_icon.dart';
import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:dice_roller/models/rolledDice.dart';

class HistoryLog extends ConsumerWidget {
  final List<RolledDice> rolledDiceList;
  final int sequence;
  const HistoryLog(
      {Key? key, required this.rolledDiceList, required this.sequence})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String handleText() {
      return '';
    }

    int getRolledDiceSum(List<RolledDice> rolledDice) {
      int sum = 0;
      for (var die in rolledDice) {
        sum += die.rollValue;
      }
      return sum < 1000 ? sum : 999;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 5, 8, 0),
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
            color: ref.watch(themeProvider).numberDisplayBgColor,
            borderRadius: BorderRadius.all(
                Radius.circular(ref.watch(themeProvider).drawerBorderRadius)),
            boxShadow: [
              ref.watch(themeProvider).innerShadow,
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: sequence > 0
              ? Column(
                  children: [
                    Flexible(
                        flex: 4,
                        child: Container(
                          child: Text(
                            '${(ref.watch(rollHistoryProvider).length) - sequence} Rolls Ago',
                            style: TextStyle(
                                color: ref
                                    .watch(themeProvider)
                                    .drawerHistorySliverTextColor),
                          ),
                        )),
                    Flexible(
                        flex: 6,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  children: rolledDiceList
                                      .map((e) => RolledDiceIcon(
                                            originalDice: e.diceValue,
                                            rolledValue: e.rollValue,
                                            fontSize: 14,
                                          ))
                                      .toList()),
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Text(
                                  '${getRolledDiceSum(rolledDiceList)}',
                                  style: TextStyle(
                                      color: ref
                                          .watch(themeProvider)
                                          .drawerHistorySliverTextColor,
                                      fontWeight: FontWeight.w900),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                )
              : Center(
                  child: Text(
                  'Simple Roller Started',
                  style: TextStyle(
                      color:
                          ref.watch(themeProvider).drawerHistorySliverTextColor,
                      fontWeight: FontWeight.w900),
                )),
        ),
      ),
    );
  }
}
