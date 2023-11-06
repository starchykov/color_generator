import 'package:color_generator/core/core.dart';
import 'package:color_generator/core/usecase/usecase.dart';
import 'package:color_generator/features/settings/domain/entities/theme/theme.dart';
import 'package:color_generator/features/settings/domain/usecases/change_locale.dart';
import 'package:color_generator/features/settings/domain/usecases/change_theme.dart';
import 'package:color_generator/features/settings/domain/usecases/get_locale.dart';
import 'package:color_generator/features/settings/domain/usecases/get_theme.dart';
import 'package:color_generator/utils/services/hive/main_box_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

/// A [Cubit] that manages the settings state, such as theme and locale.
///
/// It uses a combination of use cases to load, update, and persist settings
/// preferences.
class SettingsCubit extends Cubit<SettingsState> with MainBoxMixin {
  /// This use case is responsible for getting theme from storage.
  final GetTheme getTheme;

  /// This use case is responsible for saving theme to storage.
  final ChangeTheme changeTheme;

  /// This use case is responsible for getting locale from storage.
  final GetLocale getLocale;

  /// This use case is responsible for saving locale to storage.
  final ChangeLocale changeLocale;

  SettingsState _state = const SettingsState();

  /// Constructor for [SettingsCubit] with required use cases
  /// for settings management.
  SettingsCubit({
    required this.getTheme,
    required this.changeTheme,
    required this.getLocale,
    required this.changeLocale,
  }) : super(const SettingsState());

  /// Initializes the cubit by loading the current theme and locale
  /// from preferences.
  Future<void> initialize() async {
    await _getCurrentTheme();
    await _getCurrentLocale();
  }

  Future<void> _getCurrentTheme() async {
    final activeTheme = await getTheme.call(NoParams());
    activeTheme.fold(
      (l) {
        _state = _state.copyWith(isDarkTheme: false);
        emit(_state);
      },
      (r) {
        _state = _state.copyWith(isDarkTheme: r.themeMode == ActiveTheme.dark);
        emit(_state);
      },
    );
  }

  /// This method is responsible for loading the current theme preference
  /// and updates the state.
  Future<void> _getCurrentLocale() async {
    final result = await getLocale.call(NoParams());
    result.fold(
      (l) {
        _state = _state.copyWith();
        emit(_state);
      },
      (r) {
        final int localeId = AppLocalizations.supportedLocales.indexWhere((e) {
          return e.languageCode == r;
        });
        _state = _state.copyWith(locale: r, localeId: localeId);
        emit(_state);
      },
    );
  }

  /// This method is responsible for toggling theme mode
  /// and saving new theme value to the storage.
  Future<void> onChangeTheme() async {
    final activeTheme = await changeTheme.call(NoParams());
    activeTheme.fold(
      (l) {
        _state = _state.copyWith(isDarkTheme: false);
        emit(_state);
      },
      (r) {
        _state = _state.copyWith(isDarkTheme: r.themeMode == ActiveTheme.dark);
        emit(_state);
      },
    );
  }

  /// This method is responsible for changing application localization
  /// and saving new application localization code to the storage.
  Future<void> onChangeLocale({required int id}) async {
    final String code = AppLocalizations.supportedLocales[id].languageCode;
    if (_state.localeId == 0 && id == 0) return;
    final result = await changeLocale.call(LocaleParams(languageCode: code));
    result.fold(
      (l) {
        _state = _state.copyWith();
        emit(_state);
      },
      (r) {
        _state = _state.copyWith(locale: r, localeId: id);
        emit(_state);
      },
    );
  }
}
