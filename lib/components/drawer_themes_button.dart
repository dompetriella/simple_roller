import 'package:flutter/material.dart';

class ThemesButton extends StatelessWidget {
  const ThemesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(height: 50, width: 50, color: Colors.red),
    );
  }
}
