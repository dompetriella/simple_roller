import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:dice_roller/providers/animation_provider.dart';

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
    return GestureDetector(
      onTap: () => {
        ref
            .watch(selectedDiceProvider.notifier)
            .changeCurrentDie(diceNumber, ref),
        triggerAnimation(
          ref,
          diceButtonEffects,
          diceButtonCondition,
          [ScaleEffect(begin: 1.05, duration: 400.ms, curve: Curves.easeInOut)],
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
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
            color: ref.watch(themeProvider).diceButtonBg,
            borderRadius: BorderRadius.all(Radius.circular(
                ref.watch(themeProvider).diceButtonBorderRadius)),
            boxShadow: [
              ref.watch(themeProvider).innerShadow,
              ref.watch(themeProvider).diceButtonInnerShadow,
              ref.watch(themeProvider).diceButtonOutline,
              ref.watch(selectedDiceProvider) == diceNumber
                  ? BoxShadow(
                      color: ref.watch(themeProvider).rollButtonBgColor,
                      offset: const Offset(0, 0),
                      spreadRadius: 3,
                      blurRadius: 15,
                      blurStyle: BlurStyle.normal)
                  : const BoxShadow()
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: buttonHeight * .60,
                width: buttonWidth,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/D$diceNumberString.svg",
                      clipBehavior: Clip.antiAlias,
                      colorFilter: ColorFilter.mode(
                          ref.watch(themeProvider).diceButtonTextColor,
                          BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "D$diceNumberString",
                  style: TextStyle(
                      color: ref.watch(themeProvider).diceButtonTextColor,
                      fontSize: screenWidth < 600 ? 20 : screenHeight * .04,
                      fontWeight: FontWeight.bold),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
