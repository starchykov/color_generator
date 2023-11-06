import 'package:color_generator/core/core.dart';
import 'package:color_generator/features/settings/domain/entities/theme/theme.dart';
import 'package:color_generator/features/settings/domain/usecases/change_locale.dart';
import 'package:dartz/dartz.dart';

/// An abstract class that defines the interface for a settings repository.
///
/// This interface is used for operations related to application settings
/// such as theme and locale.
abstract class SettingsRepository {
  /// Retrieves the current theme.
  ///
  /// Returns a [Failure] or the current [Theme].
  Future<Either<Failure, Theme>> getTheme();

  /// Changes to a new theme.
  ///
  /// Returns a [Failure] or the updated [Theme].
  Future<Either<Failure, Theme>> changeTheme();

  /// Sets the light theme.
  ///
  /// Returns a [Failure] or the light [Theme].
  Future<Either<Failure, Theme>> setLightTheme();

  /// Sets the dark theme.
  ///
  /// Returns a [Failure] or the dark [Theme].
  Future<Either<Failure, Theme>> setDarkTheme();

  /// Retrieves the current locale as a string.
  ///
  /// Returns a [Failure] or the current locale [String].
  Future<Either<Failure, String>> getLocale();

  /// Changes to a new locale based on the provided [LocaleParams].
  ///
  /// Returns a [Failure] or a success message as a [String].
  Future<Either<Failure, String>> changeLocale(LocaleParams params);
}
