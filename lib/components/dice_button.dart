import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';

class DiceButton extends ConsumerWidget {
  final int diceNumber;
  DiceButton({Key? key, required this.diceNumber}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double buttonHeight = 110;
    double buttonWidth = 120;
    String diceNumberString = diceNumber.toString();
    return GestureDetector(
      onTap: () => {
        ref.watch(selectedDiceProvider.notifier).changeCurrentDie(diceNumber),
      },
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
                      offset: Offset(0, 0),
                      spreadRadius: 5,
                      blurRadius: 15,
                      blurStyle: BlurStyle.normal)
                  : BoxShadow()
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
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
                      fontSize: 20,
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
