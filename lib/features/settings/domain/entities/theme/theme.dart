import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme.freezed.dart';

/// A [freezed] class representing the theme entity with an [ActiveTheme] mode.
@freezed
class Theme with _$Theme {
  /// Const factory constructor for [Theme] with the [ActiveTheme] mode.
  const factory Theme({required ActiveTheme themeMode}) = _Theme;
}

/// An enumeration for the active theme modes.
enum ActiveTheme {
  /// Light theme mode.
  light(ThemeMode.light),

  /// Dark theme mode.
  dark(ThemeMode.dark),

  /// System default theme mode.
  system(ThemeMode.system);

  /// The [ThemeMode] associated with the enum value.
  final ThemeMode mode;

  /// Const constructor for the enum value with its associated [ThemeMode].
  const ActiveTheme(this.mode);
}
