import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'history_log.dart';

class RollHistoryBar extends ConsumerWidget {
  const RollHistoryBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<HistoryLog> getLoggingData() {
      List<HistoryLog> logsList = [];
      for (var i = 0; i < ref.watch(rollHistoryProvider).length; i++) {
        logsList.add(HistoryLog(
          rolledDiceList: ref.watch(rollHistoryProvider)[i],
          sequence: i,
        ));
      }
      return logsList.reversed.toList();
    }

    return Flexible(
      flex: getValueForScreenType(context: context, mobile: 5, tablet: 7),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
        child: Container(
          decoration: BoxDecoration(
              color: ref.watch(themeProvider).drawerColumnBg,
              borderRadius: BorderRadius.all(
                  Radius.circular(ref.watch(themeProvider).drawerBorderRadius)),
              boxShadow: [ref.watch(themeProvider).innerShadow]),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: getValueForScreenType(
                      context: context,
                      mobile: EdgeInsets.fromLTRB(24, 0, 12, 8),
                      tablet: EdgeInsets.fromLTRB(24, 0, 16, 8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Roll History',
                        style: TextStyle(
                            fontSize: getValueForScreenType(
                                context: context, mobile: 3.sh, tablet: 30),
                            fontWeight: FontWeight.w900,
                            color:
                                ref.watch(themeProvider).drawerColumnTextColor),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: getValueForScreenType(
                    context: context, mobile: 8, tablet: 10),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 12),
                  child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            ref.watch(themeProvider).columnShadow,
                            ref.watch(themeProvider).diceButtonOutline,
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(
                              ref.watch(themeProvider).drawerBorderRadius)),
                          color:
                              ref.watch(themeProvider).drawerColumnContentBg),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child:
                            ListView(reverse: true, children: getLoggingData()),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
