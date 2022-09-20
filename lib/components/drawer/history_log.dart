import 'dart:math';

import 'package:dice_roller/components/rolled_dice_icon.dart';
import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:dice_roller/models/rolledDice.dart';
import 'package:intl/intl.dart';

class HistoryLog extends ConsumerWidget {
  final List<RolledDice> rolledDiceList;
  final int sequence;
  HistoryLog({Key? key, required this.rolledDiceList, required this.sequence})
      : super(key: key);

  final _expand = StateProvider<bool>((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String handleText() {
      String messageString = ref.watch(rollHistoryProvider).length - sequence >
              1
          ? '${(ref.watch(rollHistoryProvider).length - sequence)} Rolls Ago : '
          : 'Last Roll : ';
      String time =
          DateFormat('MM-dd kk:mm').format(rolledDiceList[0].time) + '  ';
      return messageString + time;
    }

    int getRolledDiceSum(List<RolledDice> rolledDice) {
      int sum = 0;
      for (var die in rolledDice) {
        sum += die.rollValue;
      }
      return sum < 1000 ? sum : 999;
    }

    return GestureDetector(
      onTap: () {
        ref.read(_expand.notifier).state = !ref.read(_expand);
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 5, 8, 0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ref.watch(themeProvider).numberDisplayBgColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                          ref.watch(themeProvider).drawerBorderRadius)),
                      boxShadow: [
                        ref.watch(themeProvider).innerShadow,
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: sequence > 0
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Center(
                                    child: Container(
                                      child: Text(
                                        handleText(),
                                        style: TextStyle(
                                            color: ref
                                                .watch(themeProvider)
                                                .drawerHistorySliverTextColor,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  if (ref.read(_expand) == false)
                                    Text('${getRolledDiceSum(rolledDiceList)}',
                                        style: TextStyle(
                                            color: ref
                                                .watch(themeProvider)
                                                .drawerHistorySliverTextColor,
                                            fontWeight: FontWeight.w900)),
                                ],
                              ),
                              if (ref.watch(_expand))
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: rolledDiceList
                                          .map((e) => Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: RolledDiceIcon(
                                                    originalDice: e.diceValue,
                                                    rolledValue: e.rollValue,
                                                    size: 25),
                                              ))
                                          .toList()),
                                ),
                              if (ref.read(_expand) == true)
                                Text('${getRolledDiceSum(rolledDiceList)}',
                                    style: TextStyle(
                                        color: ref
                                            .watch(themeProvider)
                                            .drawerHistorySliverTextColor,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 25)),
                            ],
                          )
                        : Center(
                            child: Text(
                            'Simple Roller Started',
                            style: TextStyle(
                                color: ref
                                    .watch(themeProvider)
                                    .drawerHistorySliverTextColor,
                                fontWeight: FontWeight.w900),
                          )),
                  ),
                ),
              ],
            ),
          ),
          if (sequence > 0 && ref.watch(_expand) == false)
            Icon(
              Icons.arrow_drop_down_circle,
              color: ref.watch(themeProvider).rollButtonBgColor,
            )
        ],
      ),
    );
  }
}
