import 'package:badges/badges.dart';
import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:dice_roller/components/rolled_dice_icon.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:dice_roller/models/rolledDice.dart';
import 'package:dice_roller/providers/animation_provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
    return Container(
      constraints: BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
          color: ref.watch(themeProvider).numberDisplayBgColor,
          borderRadius: BorderRadius.all(Radius.circular(
              ref.watch(themeProvider).numberDisplayBorderRadius)),
          boxShadow: [
            ref.watch(themeProvider).innerShadow,
            ref.watch(themeProvider).numberDisplayDropShadow
          ]),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 16, 24.0, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RolledDiceView(
              size: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RepaintBoundary(
                  child: DiceIconDisplay(screenHeight: screenHeight),
                ),
                Animate(
                  adapter: TriggerAdapter(ref.watch(diceTotalCondition)),
                  effects: ref.watch(diceTotalEffects),
                  onComplete: (controller) =>
                      ref.watch(diceTotalCondition.notifier).state = false,
                  child: Text(
                    '${getRolledDiceSum(ref.watch(rollHistoryProvider).last) + ref.watch(rollHistoryProvider).last[0].modifier}',
                    style: TextStyle(
                        color: ref.watch(themeProvider).numberDisplayTextColor,
                        fontSize: 100,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                DisplayMultiplierTotal(screenHeight: screenHeight)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DisplayMultiplierTotal extends ConsumerWidget {
  const DisplayMultiplierTotal({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: screenHeight * 0.07,
      child: Center(
        child: Text('x${(ref.watch(multiplierProvider).toString())}',
            style: TextStyle(
                color: ref.watch(themeProvider).numberDisplayTextColor,
                fontSize: ref.watch(multiplierProvider) < 10
                    ? screenHeight * .05
                    : screenHeight * 0.04,
                fontWeight: FontWeight.w900)),
      ),
    );
  }
}

class DiceIconDisplay extends ConsumerWidget {
  const DiceIconDisplay({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Badge(
      showBadge: ref.watch(modifierProvider) != 0,
      elevation: 5,
      badgeColor: ref.watch(modifierSignPositive)
          ? ref.watch(themeProvider).rollButtonBgColor
          : ref.watch(themeProvider).rollButtonTextColor,
      padding: EdgeInsets.all(6),
      position: BadgePosition(top: -10, start: -10),
      badgeContent: ref.watch(modifierSignPositive)
          ? Text(
              "+${ref.watch(modifierProvider)}",
              style: TextStyle(
                  color: ref.watch(themeProvider).rollButtonTextColor),
            )
          : Text(
              "-${ref.watch(modifierProvider)}",
              style:
                  TextStyle(color: ref.watch(themeProvider).rollButtonBgColor),
            ),
      child: SizedBox(
        width: screenHeight * 0.07,
        height: screenHeight * 0.07,
        child: GestureDetector(
          onTap: () => ref.read(modifierProvider.notifier).state++,
          onLongPress: (() => ref.read(modifierSignPositive.notifier).state =
              !ref.read(modifierSignPositive)),
          onPanStart: (swipe) => ref.read(modifierProvider.notifier).state = 0,
          child: Container(
            decoration: BoxDecoration(
                color: ref.watch(themeProvider).diceTypeBgColor,
                borderRadius: BorderRadius.all(Radius.circular(
                    ref.watch(themeProvider).diceTypeBorderRadius))),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                'assets/D${ref.watch(selectedDiceProvider).toString()}.svg',
                color: ref.watch(themeProvider).diceTypeStrokeColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RolledDiceView extends ConsumerWidget {
  final double size;
  const RolledDiceView({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        height: size,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: AnimateList(
              children: ref
                  .watch(rollHistoryProvider)
                  .last
                  .map(
                    (e) => RolledDiceIcon(
                      originalDice: e.diceValue,
                      rolledValue: e.rollValue,
                      size: size,
                    ),
                  )
                  .toList(),
              adapter: TriggerAdapter(ref.watch(rollButtonPressCondition)),
              effects: ref.watch(rolledDisplayDiceEffects),
              onComplete: (controller) =>
                  ref.watch(rolledDisplayDiceCondition.notifier).state = false,
            )));
  }
}
