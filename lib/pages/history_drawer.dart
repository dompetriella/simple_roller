import 'package:flutter/material.dart';
import 'package:dice_roller/components/drawer_themes_bar.dart';

class HistoryDrawer extends StatelessWidget {
  const HistoryDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .70,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: ListView(children: [
        ThemesBar(),
        // RollHistoryView(),
        // AveragesView()
      ]),
    );
  }
}
