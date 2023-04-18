import 'package:dice_roller/providers/animation_provider.dart';
import 'package:dice_roller/providers/dice_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roller/providers/theme_provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MultiplierControls extends ConsumerWidget {
  const MultiplierControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: screenHeight * 0.08,
        width: screenWidth,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  buttonPressAnimation(ref, multiplierMinusButtonPressEffects,
                      multiplierMinusButtonPressCondition,
                      speed: 100, name: 'Minus');
                  ref.watch(multiplierProvider.notifier).decrement();
                },
                onLongPress: () {
                  buttonPressAnimation(ref, multiplierMinusButtonPressEffects,
                      multiplierMinusButtonPressCondition,
                      speed: 300);
                  ref.watch(multiplierProvider.notifier).bigDecrement();
                },
                child: Animate(
                  adapter: TriggerAdapter(
                      ref.watch(multiplierMinusButtonPressCondition)),
                  effects: ref.watch(multiplierMinusButtonPressEffects),
                  onComplete: (controller) => ref
                      .watch(multiplierMinusButtonPressCondition.notifier)
                      .state = false,
                  child: Container(
                      height: getValueForScreenType(
                          context: context, mobile: 50, tablet: 65),
                      width: getValueForScreenType(
                          context: context, mobile: 70, tablet: 80),
                      decoration: BoxDecoration(
                          color: ref.watch(themeProvider).multiplierBgColor,
                          borderRadius: BorderRadius.all(Radius.circular(
                              ref.watch(themeProvider).diceButtonBorderRadius)),
                          boxShadow: [
                            ref.watch(themeProvider).multiplierDropShadow,
                            ref.watch(themeProvider).multiplierOutline,
                          ]),
                      child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(
                              fontSize: getValueForScreenType(
                                  context: context, mobile: 60, tablet: 76),
                              fontWeight: FontWeight.w900,
                              height: .95,
                              color:
                                  ref.watch(themeProvider).multiplierTextColor),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: GestureDetector(
                  onTap: () {
                    buttonPressAnimation(ref, multiplierClearButtonPressEffects,
                        multiplierClearButtonPressCondition,
                        speed: 100, name: "Clear");
                    ref.watch(isClear.notifier).state = true;
                    ref.watch(multiplierProvider.notifier).reset();
                    ref.watch(modifierProvider.notifier).state = 0;
                    ref.watch(displayNumber.notifier).state = '0';
                    ref.watch(modifierSignPositive.notifier).state = true;
                  },
                  child: Animate(
                    adapter: TriggerAdapter(
                        ref.watch(multiplierClearButtonPressCondition)),
                    effects: ref.watch(multiplierClearButtonPressEffects),
                    onComplete: (controller) => ref
                        .watch(multiplierClearButtonPressCondition.notifier)
                        .state = false,
                    child: Container(
                      height: getValueForScreenType(
                          context: context, mobile: 50, tablet: 65),
                      width: getValueForScreenType(
                          context: context, mobile: 60, tablet: 225),
                      decoration: BoxDecoration(
                          color: ref.watch(themeProvider).multiplierBgColor,
                          borderRadius: BorderRadius.all(Radius.circular(
                              ref.watch(themeProvider).diceButtonBorderRadius)),
                          boxShadow: [
                            ref.watch(themeProvider).multiplierDropShadow,
                            ref.watch(themeProvider).multiplierOutline,
                          ]),
                      child: Center(
                          child: Text(
                        getValueForScreenType(
                            context: context, mobile: "C", tablet: "CLEAR"),
                        style: TextStyle(
                            fontSize: getValueForScreenType(
                                context: context, mobile: 30, tablet: 40),
                            fontWeight: FontWeight.w900,
                            color:
                                ref.watch(themeProvider).multiplierTextColor),
                      )),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  buttonPressAnimation(ref, multiplierPlusButtonPressEffects,
                      multiplierPlusButtonPressCondition,
                      speed: 100, name: 'Plus');
                  ref.watch(multiplierProvider.notifier).increment();
                },
                onLongPress: () {
                  buttonPressAnimation(
                    ref,
                    multiplierPlusButtonPressEffects,
                    multiplierPlusButtonPressCondition,
                    speed: 300,
                  );
                  ref.watch(multiplierProvider.notifier).bigIncrement();
                },
                child: Animate(
                  adapter: TriggerAdapter(
                      ref.watch(multiplierPlusButtonPressCondition)),
                  effects: ref.watch(multiplierPlusButtonPressEffects),
                  onComplete: (controller) => ref
                      .watch(multiplierPlusButtonPressCondition.notifier)
                      .state = false,
                  child: Container(
                      height: getValueForScreenType(
                          context: context, mobile: 50, tablet: 65),
                      width: getValueForScreenType(
                          context: context, mobile: 70, tablet: 80),
                      decoration: BoxDecoration(
                          color: ref.watch(themeProvider).multiplierBgColor,
                          borderRadius: BorderRadius.all(Radius.circular(
                              ref.watch(themeProvider).diceButtonBorderRadius)),
                          boxShadow: [
                            ref.watch(themeProvider).multiplierDropShadow,
                            ref.watch(themeProvider).multiplierOutline,
                          ]),
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(
                              fontSize: getValueForScreenType(
                                  context: context, mobile: 60, tablet: 76),
                              fontWeight: FontWeight.w900,
                              height: .95,
                              color:
                                  ref.watch(themeProvider).multiplierTextColor),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
