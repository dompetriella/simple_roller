import 'package:dice_roller/models/rolledDice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDiceProvider = StateNotifierProvider<DiceNotifier, int>((ref) {
  return DiceNotifier();
});

class DiceNotifier extends StateNotifier<int> {
  DiceNotifier() : super(20);

  void changeCurrentDie(int currentDie) {
    state = currentDie;
  }
}

final multiplierProvider =
    StateNotifierProvider<MultiplierNotifier, int>((ref) {
  return MultiplierNotifier();
});

class MultiplierNotifier extends StateNotifier<int> {
  MultiplierNotifier() : super(1);

  void increment() => state++;

  void bigIncrement() => state += 10;

  void decrement() {
    if (state > 1) {
      state--;
    }
  }

  void bigDecrement() {
    if (state < 6) {
      state = 1;
    } else {
      state -= 10;
    }
  }

  void reset() => state = 1;
}

final rollHistoryProvider =
    StateNotifierProvider<RollHistoryNotifier, List<List<RolledDice>>>((ref) {
  return RollHistoryNotifier();
});

class RollHistoryNotifier extends StateNotifier<List<List<RolledDice>>> {
  RollHistoryNotifier()
      : super([
          [RolledDice(diceValue: 20, rollValue: 0)]
        ]);

  addRoll(List<RolledDice> diceRolls) {
    state = [
      ...[diceRolls]
    ];
  }
}
