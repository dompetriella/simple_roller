import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:dice_roller/models/rolledDice.dart';
import 'dart:math';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:dice_roller/providers/animation_provider.dart';

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

  void calculateStats(WidgetRef ref) {
    List<RolledDice> lastRoll = ref.read(rollHistoryProvider).last;
    int diceValue = lastRoll[0].diceValue;
    int addToTotal = 0;
    lastRoll.forEach((element) {
      addToTotal += element.rollValue;
    });
    switch (diceValue) {
      case 20:
        ref.read(d20Stats.notifier).state.total += addToTotal;
        ref.read(d20Stats.notifier).state.times += lastRoll.length;
        ref.read(d20Stats.notifier).state.average = double.parse(
            (ref.read(d20Stats).total / ref.read(d20Stats).times)
                .toStringAsFixed(3));
        break;

      case 4:
        ref.read(d4Stats.notifier).state.total += addToTotal;
        ref.read(d4Stats.notifier).state.times += lastRoll.length;
        ref.read(d4Stats.notifier).state.average = double.parse(
            (ref.read(d4Stats).total / ref.read(d4Stats).times)
                .toStringAsFixed(3));
        break;

      case 6:
        ref.read(d6Stats.notifier).state.total += addToTotal;
        ref.read(d6Stats.notifier).state.times += lastRoll.length;
        ref.read(d6Stats.notifier).state.average = double.parse(
            (ref.read(d6Stats).total / ref.read(d6Stats).times)
                .toStringAsFixed(3));
        break;

      case 8:
        ref.read(d8Stats.notifier).state.total += addToTotal;
        ref.read(d8Stats.notifier).state.times += lastRoll.length;
        ref.read(d8Stats.notifier).state.average = double.parse(
            (ref.read(d8Stats).total / ref.read(d8Stats).times)
                .toStringAsFixed(3));
        break;

      case 10:
        ref.read(d10Stats.notifier).state.total += addToTotal;
        ref.read(d10Stats.notifier).state.times += lastRoll.length;
        ref.read(d10Stats.notifier).state.average = double.parse(
            (ref.read(d10Stats).total / ref.read(d10Stats).times)
                .toStringAsFixed(3));
        break;

      case 12:
        ref.read(d12Stats.notifier).state.total += addToTotal;
        ref.read(d12Stats.notifier).state.times += lastRoll.length;
        ref.read(d12Stats.notifier).state.average = double.parse(
            (ref.read(d12Stats).total / ref.read(d12Stats).times)
                .toStringAsFixed(3));
        break;

      case 100:
        ref.read(d100Stats.notifier).state.total += addToTotal;
        ref.read(d100Stats.notifier).state.times += lastRoll.length;
        ref.read(d100Stats.notifier).state.average =
            ref.read(d100Stats).total / ref.read(d100Stats).times;
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int getRandomNumber(int min, int max) {
      final random = Random();
      return min + random.nextInt(max - min);
    }

    var throwDirection = getRandomNumber(-20, 20);
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: GestureDetector(
        onTap: () {
          buttonPressAnimation(
              ref, rollButtonPressEffects, rollButtonPressCondition);
          ref
              .read(rollHistoryProvider.notifier)
              .addRoll(createRolledDiceList(ref));

          triggerAnimation(ref, diceTotalEffects, diceTotalCondition, [
            ScaleEffect(begin: 1.05, delay: 300.ms, curve: Curves.easeInOut),
            MoveEffect(delay: 300.ms, begin: Offset(0, 5), curve: Curves.easeIn)
          ]);

          triggerAnimation(
              ref, rolledDisplayDiceEffects, rolledDisplayDiceCondition, [
            FadeEffect(duration: 200.ms, delay: 50.ms),
            RotateEffect(
                duration: 500.ms, begin: throwDirection > 0 ? 1.80 : .20),
            MoveEffect(
                duration: 500.ms,
                begin: Offset(throwDirection.toDouble(), -20),
                curve: Curves.elasticOut,
                delay: 200.ms),
            ScaleEffect(duration: 200.ms, curve: Curves.elasticIn, begin: .7),
          ]);

          calculateStats(ref);
        },
        child: Animate(
          adapter: TriggerAdapter(ref.watch(rollButtonPressCondition)),
          effects: ref.watch(rollButtonPressEffects),
          onComplete: (controller) =>
              ref.watch(rollButtonPressCondition.notifier).state = false,
          child: Container(
            width: screenWidth,
            constraints: BoxConstraints(minHeight: 100),
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
                  fontSize: MediaQuery.of(context).size.height * 0.07,
                  color: ref.watch(themeProvider).rollButtonTextColor,
                  fontWeight: FontWeight.w900),
            )),
          ),
        ),
      ),
    );
  }
}
