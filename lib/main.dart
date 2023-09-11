import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const ProviderScope(child: DiceRoller()));
}

class DiceRoller extends StatelessWidget {
  const DiceRoller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SafeArea(child: MainPage()),
    );
  }
}
