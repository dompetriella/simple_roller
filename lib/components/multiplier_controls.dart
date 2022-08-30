import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';

class MultiplierControls extends ConsumerWidget {
  const MultiplierControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenHeight * 0.08,
        width: screenWidth,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                      color: ref.watch(themeProvider).multiplierBgColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                          ref.watch(themeProvider).diceButtonBorderRadius)),
                      boxShadow: ref.watch(themeProvider).multiplierDropShadow),
                  child: Center(
                    child: Text(
                      "-",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: ref.watch(themeProvider).multiplierBgColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                          ref.watch(themeProvider).diceButtonBorderRadius)),
                      boxShadow: ref.watch(themeProvider).multiplierDropShadow),
                  child: Center(
                      child: Text(
                    "C",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  )),
                ),
              ),
              Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                      color: ref.watch(themeProvider).multiplierBgColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                          ref.watch(themeProvider).diceButtonBorderRadius)),
                      boxShadow: ref.watch(themeProvider).multiplierDropShadow),
                  child: Center(
                    child: Text(
                      "+",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
