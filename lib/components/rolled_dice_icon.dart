import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RolledDiceIcon extends StatelessWidget {
  final int originalDice;
  final int diceNumber;
  const RolledDiceIcon(
      {Key? key, required this.originalDice, required this.diceNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, BoxConstraints constraints) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
        child: Container(
          height: constraints.maxHeight,
          width: constraints.maxHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.purple),
          child: Stack(
            children: [
              Opacity(
                opacity: .95,
                child: SvgPicture.asset(
                  'assets/D${originalDice.toString()}.svg',
                  color: Colors.white,
                ),
              ),
              Center(child: Text(diceNumber.toString()))
            ],
          ),
        ),
      );
    }));
  }
}
