import 'package:flutter/material.dart';

class HistoryDrawer extends StatelessWidget {
  const HistoryDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .85,
      color: Colors.lightBlue,
    );
  }
}
