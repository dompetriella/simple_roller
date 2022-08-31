import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';

class RolledDiceIcon extends ConsumerWidget {
  final int originalDice;
  final int rolledValue;
  const RolledDiceIcon(
      {Key? key, required this.originalDice, required this.rolledValue})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: ((context, BoxConstraints constraints) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
        child: Container(
          height: constraints.maxHeight,
          width: constraints.maxHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(
                  ref.watch(themeProvider).diceIconBorderRadius)),
              color: ref.watch(themeProvider).diceIconBgColor),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Opacity(
                  opacity: .70,
                  child: SvgPicture.asset(
                    'assets/D${originalDice.toString()}.svg',
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                  child: Text(
                rolledValue.toString(),
                style: TextStyle(
                    color: ref.watch(themeProvider).diceIconTextColor,
                    fontSize: 20),
              ))
            ],
          ),
        ),
      );
    }));
  }
}
