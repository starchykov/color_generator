import 'package:color_generator/core/core.dart';
import 'package:color_generator/core/usecase/usecase.dart';
import 'package:color_generator/features/settings/domain/entities/theme/theme.dart';
import 'package:color_generator/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

/// A use case for changing the application theme.
///
/// This class encapsulates the logic for changing the theme by
/// delegating to the [SettingsRepository].
class ChangeTheme extends UseCase<Theme, NoParams> {
  /// The repository responsible for theme settings.
  final SettingsRepository repository;

  /// Constructs a [ChangeTheme] use case with the given [SettingsRepository].
  ChangeTheme({required this.repository});

  /// Executes the use case to change the theme.
  ///
  /// It calls the changeTheme method on the settings repository and
  /// returns the result, that will complete with either a [Failure] or [Theme].
  @override
  Future<Either<Failure, Theme>> call(NoParams params) {
    return repository.changeTheme();
  }
}
