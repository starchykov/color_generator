part of 'color_generator_cubit.dart';
/// A class representing the state of the ColorGenerator.
///
/// This state includes the background color and its opacity,
/// which can be used to update the UI when either of these properties changes.
class ColorGeneratorState {
  /// The background color of the color generator.
  ///
  /// It is nullable, which means there might be no color selected yet.
  final Color? backgroundColor;

  /// The opacity of the background color.
  ///
  /// It defaults to 100, representing full opacity.
  final double opacity;

  /// Constructs a [ColorGeneratorState].
  ///
  /// This constructor allows for the creation of a new state with
  /// a given [backgroundColor] and [opacity]. If no color is provided,
  /// it defaults to null, indicating no color has been selected.
  const ColorGeneratorState({
    this.backgroundColor,
    this.opacity = 0,
  });

  /// Copy with pattern. Creates a copy of this state
  /// with the given fields replaced with new values.
  ///
  /// This method is used for updating the state in an immutable way, which
  /// is a common practice in state management to ensure predictability.
  ColorGeneratorState copyWith({
    Color? backgroundColor,
    double? opacity,
  }) {
    return ColorGeneratorState(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      opacity: opacity ?? this.opacity,
    );
  }
}
