import 'package:dice_roller/components/dice_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ButtonsDialer extends StatelessWidget {
  const ButtonsDialer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      child: ScreenTypeLayout.builder(
        mobile: (context) {
          return MobileDialer();
        },
        tablet: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 30,
            runSpacing: 30,
            children: [
              DiceButton(diceNumber: 20),
              DiceButton(diceNumber: 4),
              DiceButton(diceNumber: 6),
              DiceButton(diceNumber: 8),
              DiceButton(diceNumber: 10),
              DiceButton(diceNumber: 12),
              DiceButton(diceNumber: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileDialer extends StatelessWidget {
  const MobileDialer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: DiceButton(diceNumber: 20),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: DiceButton(diceNumber: 6),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: DiceButton(diceNumber: 4),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: DiceButton(diceNumber: 8),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: DiceButton(diceNumber: 10),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: DiceButton(diceNumber: 12),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: DiceButton(
                diceNumber: 100,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
