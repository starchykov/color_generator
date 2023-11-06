import 'dart:math';

import 'package:color_generator/utils/extensions/extensions.dart';
import 'package:color_generator/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_generator_state.dart';

/// A [Cubit] for managing the state of a color generator.
///
/// This cubit handles color changes and opacity changes
/// by emitting new states with updated color values.
class ColorGeneratorCubit extends Cubit<ColorGeneratorState> with MainBoxMixin {
  /// The current state of the color generator.
  ColorGeneratorState _state = const ColorGeneratorState();

  /// Constructor for [ColorGeneratorCubit].
  ///
  /// Initializes the cubit with a default [ColorGeneratorState] and
  /// invokes the [_initialize] method to set the initial state
  /// based on saved data.
  ColorGeneratorCubit() : super(const ColorGeneratorState()) {
    _initialize();
  }

  /// Private method to initialize the cubit.
  ///
  /// Retrieves the saved color from main box storage, sets the initial state,
  /// and emits the state to the UI.
  void _initialize() {
    const int maxOpacityValue = 100;
    final String hexColor = getData(MainBoxKeys.color) ?? '';
    final Color color = ColorsExtension.fromHex(hexColor);
    final double opacity = color.opacity * maxOpacityValue;
    _state = _state.copyWith(backgroundColor: color, opacity: opacity);
    emit(_state);
  }

  /// Public method to be called when the screen is tapped.
  ///
  /// Generates a random color, saves it to the main box storage,
  /// updates the state, and emits the new state.
  Future<void> onScreenTapped() async {
    final Random random = Random();
    final int r = random.nextInt(256);
    final int g = random.nextInt(256);
    final int b = random.nextInt(256);
    final Color color = Color.fromRGBO(r, g, b, _state.opacity);

    await addData(MainBoxKeys.color, color.toHex());

    _state = _state.copyWith(backgroundColor: color);
    emit(_state);
  }

  /// Public method to be called when the opacity is changed.
  ///
  /// Updates the color's opacity, saves the new color to the main box storage,
  /// updates the state with the new opacity, and emits the new state.
  Future<void> onOpacityChanged(double value) async {
    final Color? color = _state.backgroundColor?.withOpacity(value * 0.01);
    await addData(MainBoxKeys.color, color?.toHex());
    _state = _state.copyWith(backgroundColor: color, opacity: value);
    emit(_state);
  }
}
