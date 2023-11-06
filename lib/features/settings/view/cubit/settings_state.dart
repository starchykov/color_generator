part of 'settings_cubit.dart';

/// A class that represents the settings state which is immutable.
@immutable
class SettingsState {
  /// Indicates if the dark theme is enabled.
  final bool isDarkTheme;

  /// Indicates if the offline mode is enabled.
  final bool isOfflineMode;

  /// The ID representing the current locale setting.
  final int localeId;

  /// The code of the current locale setting as a string.
  final String locale;

  /// Constructs a [SettingsState] with the given settings,
  /// with defaults if none are provided.
  const SettingsState({
    this.isDarkTheme = false,
    this.isOfflineMode = false,
    this.localeId = 0,
    this.locale = 'en',
  });

  /// Creates a copy of this [SettingsState] with the given
  /// overrides for properties.
  SettingsState copyWith({
    bool? isDarkTheme,
    bool? isOfflineMode,
    int? localeId,
    String? locale,
  }) {
    return SettingsState(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      isOfflineMode: isOfflineMode ?? this.isOfflineMode,
      localeId: localeId ?? this.localeId,
      locale: locale ?? this.locale,
    );
  }
}
