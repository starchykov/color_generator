import 'package:color_generator/core/core.dart';
import 'package:color_generator/features/color_generator/cubit/color_generator_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A StatelessWidget that provides a UI for the ColorGenerator application.
///
/// This widget listens to the ColorGeneratorCubit and rebuilds its UI
/// when the cubit emits a new state. It allows users to tap the screen
/// to generate a new color and use a slider to change the opacity.
class ColorGenerator extends StatelessWidget {
  /// Default [ColorGenerator] widget constructs.
  const ColorGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    // Constants for maximum opacity value and slider divisions.
    const double maxOpacityValue = 100;
    const int sliderDivisions = 10;
    final ColorGeneratorCubit cubit = context.read<ColorGeneratorCubit>();

    return BlocBuilder<ColorGeneratorCubit, ColorGeneratorState>(
      builder: (context, state) {
        return CupertinoPageScaffold(
          backgroundColor: CupertinoColors.systemGroupedBackground,
          child: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    decoration: BoxDecoration(
                      color: state.backgroundColor,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    AppLocalizations.of(context)?.helloThere ?? 'Hello there',
                    style: CupertinoTheme.of(context)
                        .textTheme.navLargeTitleTextStyle,
                  ),
                ),
                Positioned.fill(
                  child: GestureDetector(
                    onTap: cubit.onScreenTapped,
                  ),
                ),
                Positioned(
                  bottom: Sizes.p16,
                  left: Sizes.zero,
                  right: Sizes.zero,
                  child: Material(
                    color: Palette.transparent,
                    child: Slider.adaptive(
                      value: state.opacity,
                      max: maxOpacityValue,
                      divisions: sliderDivisions,
                      activeColor: Palette.primary,
                      label: 'Transparency ${state.opacity} %',
                      onChanged: cubit.onOpacityChanged,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
