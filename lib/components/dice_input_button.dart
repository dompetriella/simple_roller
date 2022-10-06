import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';

class DiceInputButton extends ConsumerWidget {
  const DiceInputButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double buttonHeight = 110;
    double buttonWidth = 120;

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
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: buttonHeight * .60,
                width: buttonWidth,
                child: Center(
                  child: TextField(
                    showCursor: false,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      focusColor: ref.watch(themeProvider).bgColor,
                      fillColor:
                          ref.watch(themeProvider).diceButtonInputColorBg,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ref.watch(themeProvider).diceButtonBorderRadius),
                      ),
                    ),
                    style: TextStyle(
                        color:
                            ref.watch(themeProvider).diceButtonInputTextColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "D(x)",
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
