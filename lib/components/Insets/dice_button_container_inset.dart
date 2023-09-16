import 'package:dice_roller/providers/dice_provider.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class DiceButtonContainerInset extends ConsumerWidget {
  const DiceButtonContainerInset({
    super.key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.diceNumber,
    required this.diceNumberString,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double buttonWidth;
  final double buttonHeight;
  final int diceNumber;
  final String diceNumberString;
  final double screenWidth;
  final double screenHeight;

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
                    fontSize: screenWidth < 600 ? 20 : screenHeight * .03,
                    fontWeight: FontWeight.bold),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
