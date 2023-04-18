import 'dart:async';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:dice_roller/components/multiplier_controls.dart';
import 'package:dice_roller/components/display.dart';
import 'package:dice_roller/components/roll_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'history_drawer.dart';
import 'package:dice_roller/components/buttons_dialer.dart';
import 'package:dice_roller/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/version.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

Future getStoredTheme(WidgetRef ref) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? storedTheme = prefs.getString('theme');
  var theme = themesDictionary[storedTheme];
  ref.read(themeProvider.notifier).state = theme ?? defaultTheme;
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    getStoredTheme(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ref.watch(themeProvider).bgColor,
      endDrawer: const HistoryDrawer(),
      body: Builder(builder: (context) {
        return GestureDetector(
          onPanUpdate: (swipe) {
            if (swipe.delta.dx < 0) {
              Scaffold.of(context).openEndDrawer();
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
            child: ListView(
              children: [
                StickyHeader(
                  header: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      color: ref.watch(themeProvider).bgColor,
                      child: Column(
                        children: const [
                          Display(),
                          RollButton(),
                          MultiplierControls(),
                        ],
                      ),
                    ),
                  ),
                  content: const ButtonsDialer(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
