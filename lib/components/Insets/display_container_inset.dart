import 'package:dice_roller/components/display.dart';
import 'package:dice_roller/providers/animation_provider.dart';
import 'package:dice_roller/providers/dice_provider.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class DisplayContainerInset extends ConsumerWidget {
  const DisplayContainerInset({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: const BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
          color: ref.watch(themeProvider).numberDisplayBgColor,
          borderRadius: BorderRadius.all(Radius.circular(
              ref.watch(themeProvider).numberDisplayBorderRadius)),
          boxShadow: [
            ref.watch(themeProvider).innerShadow,
            ref.watch(themeProvider).numberDisplayDropShadow
          ]),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 16, 24.0, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: screenWidth * .7,
                    child: const RolledDiceView(
                      size: 35,
                    ),
                  ),
                ),
                Semantics(
                  button: true,
                  label: 'Open Settings Drawer',
                  child: GestureDetector(
                    onTap: () => Scaffold.of(context).openEndDrawer(),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ref.watch(themeProvider).numberDisplayBgColor,
                          boxShadow: [
                            ref.watch(themeProvider).multiplierDropShadow
                          ],
                          border: Border.all(
                              color: ref
                                  .watch(themeProvider)
                                  .numberDisplayTextColor),
                          borderRadius: BorderRadius.circular(
                              ref.watch(themeProvider).diceIconBorderRadius)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.menu,
                          size: 24,
                          color:
                              ref.watch(themeProvider).numberDisplayTextColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DiceIconDisplay(screenHeight: screenHeight),
                Animate(
                  adapter: TriggerAdapter(ref.watch(diceTotalCondition)),
                  effects: ref.watch(diceTotalEffects),
                  onComplete: (controller) =>
                      ref.watch(diceTotalCondition.notifier).state = false,
                  child: Semantics(
                    value: ref.watch(displayNumber),
                    child: Text(
                      ref.watch(displayNumber),
                      semanticsLabel: 'Roll Result Total: ',
                      style: TextStyle(
                          color:
                              ref.watch(themeProvider).numberDisplayTextColor,
                          fontSize: 100,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                DisplayMultiplierTotal(screenHeight: screenHeight)
              ],
            )
          ],
        ),
      ),
    );
  }
}
