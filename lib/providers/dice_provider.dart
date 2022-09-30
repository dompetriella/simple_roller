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

  void increment() {
    var testState = state;
    testState++;
    if (testState > 99) {
      state = 99;
    } else {
      state++;
    }
  }

  void bigIncrement() {
    var testState = state;
    testState += 10;
    if (testState > 99) {
      state = 99;
    } else {
      state = testState;
    }
  }

  void decrement() {
    var testState = state;
    testState--;
    if (testState > 1) {
      state--;
    } else {
      state = 1;
    }
  }

  void bigDecrement() {
    var testState = state;
    testState -= 10;
    if (testState < 1) {
      state = 1;
    } else {
      state = testState;
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
    state = [...state, diceRolls];
  }
}

final d20Stats = StateProvider<StatsDice>(
  // We return the default sort type, here name.
  (ref) => StatsDice(total: 0, times: 0),
);

final d4Stats = StateProvider<StatsDice>(
  // We return the default sort type, here name.
  (ref) => StatsDice(total: 0, times: 0),
);

final d6Stats = StateProvider<StatsDice>(
  // We return the default sort type, here name.
  (ref) => StatsDice(total: 0, times: 0),
);

final d8Stats = StateProvider<StatsDice>(
  // We return the default sort type, here name.
  (ref) => StatsDice(total: 0, times: 0),
);

final d10Stats = StateProvider<StatsDice>(
  // We return the default sort type, here name.
  (ref) => StatsDice(total: 0, times: 0),
);

final d12Stats = StateProvider<StatsDice>(
  // We return the default sort type, here name.
  (ref) => StatsDice(total: 0, times: 0),
);

final d100Stats = StateProvider<StatsDice>(
  // We return the default sort type, here name.
  (ref) => StatsDice(total: 0, times: 0),
);
