import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'stats_log.dart';

class StatsBar extends ConsumerWidget {
  const StatsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              color: ref.watch(themeProvider).drawerColumnBg,
              borderRadius: BorderRadius.all(
                  Radius.circular(ref.watch(themeProvider).drawerBorderRadius)),
              boxShadow: [ref.watch(themeProvider).innerShadow]),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Stats',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color:
                                ref.watch(themeProvider).drawerColumnTextColor),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 8, 12, 8),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            ref.watch(themeProvider).columnShadow,
                            ref.watch(themeProvider).diceButtonOutline
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(
                              ref.watch(themeProvider).drawerBorderRadius)),
                          color:
                              ref.watch(themeProvider).drawerColumnContentBg),
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(2, 10, 2, 5),
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                StatsLog(
                                  diceValue: '20',
                                ),
                                StatsLog(diceValue: '6'),
                                StatsLog(diceValue: '4'),
                                StatsLog(diceValue: '8'),
                                StatsLog(diceValue: '10'),
                                StatsLog(diceValue: '12'),
                                StatsLog(diceValue: '100')
                              ])),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
