import 'package:dice_roller/components/rolled_dice_icon.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../providers/animation_provider.dart';
import '../providers/dice_provider.dart';
import '../providers/theme_provider.dart';

class LargeDisplay extends ConsumerWidget {
  const LargeDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sw),
      child: Container(
        height: 200,
        width: 100.sw,
        decoration: BoxDecoration(
            color: ref.watch(themeProvider).numberDisplayBgColor,
            borderRadius: BorderRadius.all(Radius.circular(
                ref.watch(themeProvider).numberDisplayBorderRadius)),
            boxShadow: [
              ref.watch(themeProvider).innerShadow,
              ref.watch(themeProvider).numberDisplayDropShadow
            ]),
        child: Stack(
          children: [
            Center(
              child: Text(
                ref.watch(displayNumber),
                style: TextStyle(
                    color: ref.watch(themeProvider).numberDisplayTextColor,
                    fontSize: 120,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 180,
                width: 22.sw,
                child: ListView(
                    scrollDirection: Axis.vertical,
                    children: ref.watch(isClear)
                        ? []
                        : [
                            Wrap(
                              children: AnimateList(
                                children: ref
                                    .watch(rollHistoryProvider)
                                    .last
                                    .map(
                                      (e) => RolledDiceIcon(
                                        originalDice: e.diceValue,
                                        rolledValue: e.rollValue,
                                        size: 35,
                                      ),
                                    )
                                    .toList(),
                                adapter: TriggerAdapter(
                                    ref.watch(rollButtonPressCondition)),
                                effects: ref.watch(rolledDisplayDiceEffects),
                                onComplete: (controller) => ref
                                    .watch(rolledDisplayDiceCondition.notifier)
                                    .state = false,
                              ),
                            )
                          ]),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () => Scaffold.of(context).openEndDrawer(),
                  child: Icon(
                    Icons.menu,
                    size: 40,
                    color: ref.watch(themeProvider).numberDisplayTextColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
