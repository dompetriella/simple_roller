import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:dice_roller/providers/animation_provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DiceButton extends ConsumerWidget {
  final int diceNumber;
  const DiceButton({Key? key, required this.diceNumber}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double buttonHeight =
        getValueForScreenType(context: context, mobile: 110, tablet: 15.5.sh);
    double buttonWidth =
        getValueForScreenType(context: context, mobile: 120, tablet: 15.5.sh);
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
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
          color: ref.watch(themeProvider).diceButtonBg,
          borderRadius: BorderRadius.all(
              Radius.circular(ref.watch(themeProvider).diceButtonBorderRadius)),
          boxShadow: [
            ref.watch(themeProvider).innerShadow,
            ref.watch(themeProvider).diceButtonInnerShadow,
            ref.watch(themeProvider).diceButtonOutline,
            ref.watch(selectedDiceProvider) == diceNumber
                ? BoxShadow(
                    color: ref.watch(themeProvider).rollButtonBgColor,
                    offset: const Offset(0, 0),
                    spreadRadius: 5,
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
                child: SvgPicture.asset(
                  "assets/D$diceNumberString.svg",
                  color: ref.watch(themeProvider).diceButtonTextColor,
                  clipBehavior: Clip.antiAlias,
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
                    fontSize: getValueForScreenType(
                        context: context, mobile: 20, tablet: 2.5.sh),
                    fontWeight: FontWeight.bold),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
