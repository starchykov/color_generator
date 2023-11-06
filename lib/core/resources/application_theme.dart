import 'package:color_generator/core/resources/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A utility class providing methods to create theme data for the application.
///
/// It includes both Cupertino (iOS-style) and Material (Android-style) themes,
/// with light and dark variations.
class ApplicationTheme {
  // Private constructor to prevent instantiation of this utility class.
  const ApplicationTheme._();

  /// Returns the light variation of the Cupertino (iOS-style) theme data.
  static CupertinoThemeData cupertinoLight() {
    return const CupertinoThemeData(
      primaryColor: Palette.primary,
      brightness: Brightness.light,
    );
  }

  /// Returns the dark variation of the Cupertino (iOS-style) theme data.
  static CupertinoThemeData cupertinoDark() {
    return const CupertinoThemeData(
      primaryColor: Palette.primary,
      brightness: Brightness.dark,
    );
  }

  /// Returns the light variation of the Material (Android-style) theme data.
  static ThemeData materialLight() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Palette.primary,
      ),
      splashColor: Palette.transparent,
      highlightColor: Palette.transparent,
      hoverColor: Palette.transparent,
      useMaterial3: true,
      primaryColor: Palette.primary,
      canvasColor: Palette.primary,
      scaffoldBackgroundColor: Palette.background,
      textTheme: const TextTheme(),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  /// Returns the dark variation of the Material (Android-style) theme data.
  static ThemeData materialDark() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Palette.primary,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      primaryColor: Palette.primary,
      scaffoldBackgroundColor: Palette.backgroundDark,
      textTheme: const TextTheme(),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
