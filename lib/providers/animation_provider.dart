import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

@immutable
class TriggerAdapter extends Adapter {
  TriggerAdapter(this.triggerCondition);

  final bool triggerCondition;

  @override
  void init(AnimationController controller) {
    if (triggerCondition) controller.forward(from: 0);
  }
}

void triggerAnimation(
    WidgetRef ref,
    StateProvider<List<Effect<dynamic>>> effectsProvider,
    StateProvider<bool> condition,
    List<Effect<dynamic>> effects) {
  ref.read(condition.notifier).state = false;
  ref.read(effectsProvider.notifier).state..clear();
  effects.forEach((element) {
    ref.read(effectsProvider.notifier).state..add(element);
  });
  ref.read(condition.notifier).state = true;
}

void buttonPressAnimation(
    WidgetRef ref,
    StateProvider<List<Effect<dynamic>>> effectsProvider,
    StateProvider<bool> condition,
    {double speed = 250,
    String name = ''}) {
  List<Effect<dynamic>> effects = [
    MoveEffect(
        begin: Offset(0, 0),
        end: Offset(0, -2),
        duration: speed.ms,
        curve: Curves.easeOut),
    MoveEffect(begin: Offset(0, 2), end: Offset(0, 0), delay: speed.ms),
    ScaleEffect(
        begin: 1.0, end: 0.9, duration: speed.ms, curve: Curves.easeOut),
    ScaleEffect(begin: 0.9, end: 1.1, delay: speed.ms)
  ];
  print('$name: Current State: ${ref.read(condition)}');
  ref.read(condition.notifier).state = false;
  ref.read(effectsProvider.notifier).state.clear();
  for (var element in effects) {
    ref.read(effectsProvider.notifier).state.add(element);
  }
  ref.read(condition.notifier).state = true;
  print('$name: CurrentState: ${ref.read(condition)}');
}

//Roll Button Animations
final rollButtonPressEffects =
    StateProvider<List<Effect<dynamic>>>((ref) => []);
final rollButtonPressCondition = StateProvider<bool>((ref) => false);

//Multiplier Button Animations
final multiplierPlusButtonPressEffects =
    StateProvider<List<Effect<dynamic>>>((ref) => []);
final multiplierPlusButtonPressCondition = StateProvider<bool>((ref) => false);

final multiplierMinusButtonPressEffects =
    StateProvider<List<Effect<dynamic>>>((ref) => []);
final multiplierMinusButtonPressCondition = StateProvider<bool>((ref) => false);

final multiplierClearButtonPressEffects =
    StateProvider<List<Effect<dynamic>>>((ref) => []);
final multiplierClearButtonPressCondition = StateProvider<bool>((ref) => false);