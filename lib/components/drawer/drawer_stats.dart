import 'package:flutter/material.dart';

class StatsBar extends StatelessWidget {
  const StatsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(color: Colors.green),
      ),
    );
  }
}
