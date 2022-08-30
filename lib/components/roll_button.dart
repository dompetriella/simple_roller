import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';

class RollButton extends ConsumerWidget {
  const RollButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      child: Container(
        width: screenWidth,
        height: screenHeight * .1,
        decoration: BoxDecoration(
            color: ref.watch(themeProvider).rollButtonBgColor,
            borderRadius: BorderRadius.all(Radius.circular(
                ref.watch(themeProvider).numberDisplayBorderRadius)),
            boxShadow: ref.watch(themeProvider).innerShadow),
        child: Center(
            child: Text(
          "ROLL",
          style: TextStyle(
              fontSize: 50,
              color: ref.watch(themeProvider).rollButtonTextColor,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
