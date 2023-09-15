import 'package:dice_roller/components/Insets/display_container_inset.dart';
import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:dice_roller/components/rolled_dice_icon.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:dice_roller/providers/animation_provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Display extends ConsumerWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Semantics(
      container: true,
      label: 'Dice Display',
      explicitChildNodes: true,
      child: DisplayContainerInset(
          screenWidth: screenWidth, screenHeight: screenHeight),
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
        child: Semantics(
          label: 'Number of Dice',
          liveRegion: true,
          value: (ref.watch(multiplierProvider)).toString(),
          child: Semantics(
            excludeSemantics: true,
            child: Text('x${(ref.watch(multiplierProvider).toString())}',
                style: TextStyle(
                    color: ref.watch(themeProvider).numberDisplayTextColor,
                    fontSize: ref.watch(multiplierProvider) < 10
                        ? screenHeight * .05
                        : screenHeight * 0.04,
                    fontWeight: FontWeight.w900)),
          ),
        ),
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
    String formatModifierToString() {
      if (ref.read(modifierSignPositive)) {
        return '+${ref.watch(modifierProvider)}';
      }
      return '- ${ref.watch(modifierProvider)}';
    }

    return Semantics(
      label: 'Current Dice d${ref.watch(selectedDiceProvider)}',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: screenHeight * 0.07,
            height: screenHeight * 0.07,
            child: GestureDetector(
              onTap: () => (ref.read(modifierProvider) < 99)
                  ? ref.read(modifierProvider.notifier).state += 1
                  : null,
              onLongPress: (() =>
                  ref.read(modifierProvider.notifier).state = 0),
              onPanStart: (swipe) => ref
                  .read(modifierSignPositive.notifier)
                  .state = !ref.read(modifierSignPositive),
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
          if (ref.watch(modifierProvider) != 0)
            Positioned(
                top: -8,
                left: -8,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: ref.watch(modifierSignPositive)
                          ? ref.watch(themeProvider).rollButtonBgColor
                          : ref.watch(themeProvider).rollButtonTextColor,
                      borderRadius: BorderRadius.circular(
                          ref.watch(themeProvider).diceButtonBorderRadius),
                      border: Border.all(
                        color: ref.watch(modifierSignPositive)
                            ? ref.watch(themeProvider).rollButtonTextColor
                            : ref.watch(themeProvider).rollButtonBgColor,
                      )),
                  child: Center(
                    child: Text(
                      ref.watch(modifierSignPositive)
                          ? '+${ref.watch(modifierProvider)}'
                          : '- ${ref.watch(modifierProvider)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: ref.watch(modifierSignPositive)
                            ? ref.watch(themeProvider).rollButtonTextColor
                            : ref.watch(themeProvider).rollButtonBgColor,
                      ),
                    ),
                  ),
                ).animate().scale(begin: 0.5, duration: 100.ms))
        ],
      ),
    );
  }
}

class RolledDiceView extends ConsumerWidget {
  final double size;
  const RolledDiceView({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Semantics(
      label: '${ref.read(rollHistoryProvider).last.length} dice rolled',
      child: SizedBox(
          height: size,
          child: MergeSemantics(
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: ref.watch(isClear)
                    ? []
                    : AnimateList(
                        children: ref
                            .watch(rollHistoryProvider)
                            .last
                            .map(
                              (e) => Semantics(
                                readOnly: true,
                                label: 'd${e.diceValue} rolled',
                                child: RolledDiceIcon(
                                  originalDice: e.diceValue,
                                  rolledValue: e.rollValue,
                                  size: size,
                                ),
                              ),
                            )
                            .toList(),
                        adapter:
                            TriggerAdapter(ref.watch(rollButtonPressCondition)),
                        effects: ref.watch(rolledDisplayDiceEffects),
                        onComplete: (controller) => ref
                            .watch(rolledDisplayDiceCondition.notifier)
                            .state = false,
                      )),
          )),
    );
  }
}
