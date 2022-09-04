import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:dice_roller/components/rolled_dice_icon.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:dice_roller/models/rolledDice.dart';

class Display extends ConsumerWidget {
  const Display({Key? key}) : super(key: key);

  int getRolledDiceSum(List<RolledDice> rolledDice) {
    int sum = 0;
    for (var die in rolledDice) {
      sum += die.rollValue;
    }
    return sum < 1000 ? sum : 999;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var widgetHeight = screenHeight * .20;
    var widgetWidth = screenWidth;
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        width: widgetWidth,
        height: widgetHeight,
        decoration: BoxDecoration(
            color: ref.watch(themeProvider).numberDisplayBgColor,
            borderRadius: BorderRadius.all(Radius.circular(
                ref.watch(themeProvider).numberDisplayBorderRadius)),
            boxShadow: [ref.watch(themeProvider).innerShadow]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: widgetHeight * .20,
                  width: widgetWidth * .85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                          ref.watch(themeProvider).diceIconBorderRadius)),
                      color: ref.watch(themeProvider).numberDisplayBgColor),
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: ref
                          .watch(rollHistoryProvider)
                          .last
                          .map((e) => RolledDiceIcon(
                                originalDice: e.diceValue,
                                rolledValue: e.rollValue,
                              ))
                          .toList())),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: ref.watch(themeProvider).diceTypeBgColor,
                          borderRadius: BorderRadius.all(Radius.circular(
                              ref.watch(themeProvider).diceTypeBorderRadius))),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset(
                          'assets/D${ref.watch(selectedDiceProvider).toString()}.svg',
                          color: ref.watch(themeProvider).diceTypeStrokeColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: widgetWidth * .4,
                    child: Center(
                      child: Text(
                        '${getRolledDiceSum(ref.watch(rollHistoryProvider).last)}',
                        style: TextStyle(
                            color:
                                ref.watch(themeProvider).numberDisplayTextColor,
                            fontSize: getRolledDiceSum(
                                        ref.watch(rollHistoryProvider).last) <
                                    100
                                ? 100
                                : 80,
                            height: getRolledDiceSum(
                                        ref.watch(rollHistoryProvider).last) <
                                    100
                                ? 1.1
                                : 1.4,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: widgetWidth * .12,
                  child: Text('x${(ref.watch(multiplierProvider).toString())}',
                      style: TextStyle(
                          color:
                              ref.watch(themeProvider).numberDisplayTextColor,
                          fontSize:
                              ref.watch(multiplierProvider) < 10 ? 40 : 24,
                          fontWeight: FontWeight.w900)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
