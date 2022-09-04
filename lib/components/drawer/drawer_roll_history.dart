import 'package:flutter/material.dart';

class RollHistoryBar extends StatelessWidget {
  const RollHistoryBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Container(color: Colors.red),
      ),
    );
  }
}
