import 'package:dice_roller/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'drawer_themes_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/themes.dart';

class ThemesBar extends ConsumerWidget {
  const ThemesBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    ref.watch(themeProvider.notifier).state = daylight;
                  },
                  child: Text("Daylight")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    ref.watch(themeProvider.notifier).state = twilight;
                  },
                  child: Text("Twilight")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    ref.watch(themeProvider.notifier).state = midnight;
                  },
                  child: Text("Midnight")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    ref.watch(themeProvider.notifier).state = verdant;
                  },
                  child: Text("Verdant")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    ref.watch(themeProvider.notifier).state = glacier;
                  },
                  child: Text("Glacier")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    ref.watch(themeProvider.notifier).state = fireball;
                  },
                  child: Text("Fireball")),
            ),
            //                         Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //       onPressed: () {
            //         ref.watch(themeProvider.notifier).state = obelisk;
            //       },
            //       child: Text("Obelisk")),
            // ),
          ],
        )));
  }
}
