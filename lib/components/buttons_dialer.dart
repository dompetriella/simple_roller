import 'package:dice_roller/components/dice_button.dart';
import 'package:flutter/material.dart';

class ButtonsDialer extends StatelessWidget {
  const ButtonsDialer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          DiceButton(diceNumber: 20),
          DiceButton(diceNumber: 6),
          DiceButton(diceNumber: 4),
          DiceButton(diceNumber: 8),
          DiceButton(diceNumber: 10),
          DiceButton(diceNumber: 12),
          DiceButton(
            diceNumber: 100,
          ),
        ],
      ),
    );
  }
}
