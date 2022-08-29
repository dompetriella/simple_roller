import 'package:flutter/material.dart';
import 'package:dice_roller/components/rolled_dice_icon.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';

class NumberDisplay extends StatelessWidget {
  const NumberDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var widgetHeight = screenHeight * .20;
    var widgetWidth = screenWidth;
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        width: widgetWidth,
        height: widgetHeight,
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: widgetHeight * .20,
                width: widgetWidth * .85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.lightGreen),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    RolledDiceIcon(originalDice: 20, diceNumber: 8),
                    RolledDiceIcon(originalDice: 20, diceNumber: 12),
                    RolledDiceIcon(originalDice: 20, diceNumber: 2),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SvgPicture.asset(
                        'assets/D20.svg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '20',
                    style: TextStyle(color: Colors.white, fontSize: 90),
                  ),
                  Text('x2',
                      style: TextStyle(color: Colors.white, fontSize: 50))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
