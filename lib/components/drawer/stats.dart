import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'stats_log.dart';

class StatsBar extends ConsumerWidget {
  const StatsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ref.watch(themeProvider).drawerColumnBg,
                  borderRadius: BorderRadius.all(Radius.circular(
                      ref.watch(themeProvider).drawerBorderRadius)),
                  boxShadow: [ref.watch(themeProvider).innerShadow]),
              child: Column(
                children: [
                  Expanded(
                    flex: getValueForScreenType(
                        context: context, mobile: 3, tablet: 2),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    ),
                  ),
                  Expanded(
                    flex: getValueForScreenType(
                        context: context, mobile: 7, tablet: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              ref.watch(themeProvider).columnShadow,
                              ref.watch(themeProvider).diceButtonOutline
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(
                                ref.watch(themeProvider).themeBarBorderRadius)),
                            color:
                                ref.watch(themeProvider).drawerColumnContentBg),
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: getValueForScreenType(
                                  context: context,
                                  mobile: [
                                    StatsLog(
                                      diceValue: '20',
                                    ),
                                    StatsLog(diceValue: '6'),
                                    StatsLog(diceValue: '4'),
                                    StatsLog(diceValue: '8'),
                                    StatsLog(diceValue: '10'),
                                    StatsLog(diceValue: '12'),
                                    StatsLog(diceValue: '100')
                                  ],
                                  tablet: [
                                    StatsLog(
                                      diceValue: '20',
                                    ),
                                    StatsLog(diceValue: '4'),
                                    StatsLog(diceValue: '6'),
                                    StatsLog(diceValue: '8'),
                                    StatsLog(diceValue: '10'),
                                    StatsLog(diceValue: '12'),
                                    StatsLog(diceValue: '100')
                                  ],
                                ))),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: getValueForScreenType(
                  context: context,
                  mobile: EdgeInsets.fromLTRB(24, 10, 10, 10.0),
                  tablet: EdgeInsets.fromLTRB(24, 20, 16, 8)),
              child: Text(
                'Stats',
                style: TextStyle(
                    fontSize: getValueForScreenType(
                        context: context, mobile: 3.sh, tablet: 30),
                    fontWeight: FontWeight.w900,
                    color: ref.watch(themeProvider).drawerColumnTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
