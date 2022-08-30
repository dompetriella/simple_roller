import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDiceProvider = StateNotifierProvider<DiceNotifier, int>((ref) {
  return DiceNotifier();
});

class DiceNotifier extends StateNotifier<int> {
  DiceNotifier() : super(0);

  void changeCurrentDie(int currentDie) {
    state = currentDie;
    print(state);
  }
}
