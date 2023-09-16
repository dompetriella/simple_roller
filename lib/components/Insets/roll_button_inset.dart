import 'package:dice_roller/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class RollButtonInset extends ConsumerWidget {
  const RollButtonInset({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: screenWidth * .9,
      constraints: const BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
          color: ref.watch(themeProvider).rollButtonBgColor,
          borderRadius: BorderRadius.all(Radius.circular(
              ref.watch(themeProvider).numberDisplayBorderRadius)),
          boxShadow: [
            ref.watch(themeProvider).innerShadow,
            ref.watch(themeProvider).rollButtonOutline
          ]),
      child: Center(
          child: Semantics(
        excludeSemantics: true,
        child: Text(
          "ROLL",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.07,
              color: ref.watch(themeProvider).rollButtonTextColor,
              fontWeight: FontWeight.w900),
        ),
      )),
    );
  }
}
