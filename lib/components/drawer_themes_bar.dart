import 'package:flutter/material.dart';
import 'drawer_themes_button.dart';

class ThemesBar extends StatelessWidget {
  const ThemesBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ThemesButton(),
          ThemesButton(),
          ThemesButton(),
          ThemesButton(),
          ThemesButton(),
          ThemesButton(),
          ThemesButton(),
        ],
      ),
    );
  }
}
