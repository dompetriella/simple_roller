import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:dice_roller/providers/animation_provider.dart';

import 'Insets/dice_button_container_inset.dart';

class DiceButton extends ConsumerWidget {
  final int diceNumber;
  const DiceButton({Key? key, required this.diceNumber}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    double buttonHeight = screenWidth < 600 ? 110 : screenHeight * .20;
    double buttonWidth = screenWidth < 600 ? 120 : screenHeight * .20;
    String diceNumberString = diceNumber.toString();
    return Semantics(
      button: true,
      child: Semantics(
        label: 'Switch to ',
        button: true,
        child: GestureDetector(
          onTap: () => {
            ref
                .watch(selectedDiceProvider.notifier)
                .changeCurrentDie(diceNumber, ref),
            triggerAnimation(
              ref,
              diceButtonEffects,
              diceButtonCondition,
              [
                ScaleEffect(
                    begin: 1.05, duration: 400.ms, curve: Curves.easeInOut)
              ],
            ),
            ref.read(modifierProvider.notifier).state = 0
          },
          child: diceNumber == ref.watch(selectedDiceProvider)
              ? Animate(
                  adapter: TriggerAdapter(ref.watch(diceButtonCondition)),
                  effects: ref.watch(diceButtonEffects),
                  onComplete: (controller) =>
                      ref.watch(diceButtonCondition.notifier).state = false,
                  child: DiceButtonContainer(
                      buttonWidth: buttonWidth,
                      buttonHeight: buttonHeight,
                      diceNumber: diceNumber,
                      diceNumberString: diceNumberString),
                )
              : DiceButtonContainer(
                  buttonWidth: buttonWidth,
                  buttonHeight: buttonHeight,
                  diceNumber: diceNumber,
                  diceNumberString: diceNumberString),
        ),
      ),
    );
  }
}

class DiceButtonContainer extends ConsumerWidget {
  const DiceButtonContainer({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.diceNumber,
    required this.diceNumberString,
  }) : super(key: key);

  final double buttonWidth;
  final double buttonHeight;
  final int diceNumber;
  final String diceNumberString;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: DiceButtonContainerInset(
          buttonWidth: buttonWidth,
          buttonHeight: buttonHeight,
          diceNumber: diceNumber,
          diceNumberString: diceNumberString,
          screenWidth: screenWidth,
          screenHeight: screenHeight),
    );
  }
}
