import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiceButton extends StatelessWidget {
  final int diceNumber;
  DiceButton({Key? key, required this.diceNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonSize = 130;
    String diceNumberString = diceNumber.toString();
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: const BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: buttonSize * .65,
              width: buttonSize,
              child: Center(
                child: SvgPicture.asset(
                  "assets/D$diceNumberString.svg",
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "D$diceNumberString",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
