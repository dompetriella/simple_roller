class RolledDice {
  final int rollValue;
  final int diceValue;
  final DateTime time = DateTime.now();
  final int modifier;

  RolledDice(
      {required this.rollValue, required this.diceValue, this.modifier = 0});
}

class StatsDice {
  int total;
  int times;
  double average;

  StatsDice({required this.total, required this.times, this.average = 0});
}
