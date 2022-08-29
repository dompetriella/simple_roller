import 'package:flutter/material.dart';
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
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
          color: ref.watch(themeProvider).diceButtonBg,
          borderRadius: BorderRadius.all(Radius.circular(
              ref.watch(themeProvider).diceButtonBorderRadius))),
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
    );
  }
}
