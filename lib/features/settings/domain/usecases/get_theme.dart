import 'package:color_generator/core/core.dart';
import 'package:color_generator/core/usecase/usecase.dart';
import 'package:color_generator/features/settings/domain/entities/theme/theme.dart';
import 'package:color_generator/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

/// A use case that retrieves the current theme from a [SettingsRepository].
class GetTheme extends UseCase<Theme, NoParams> {

  /// The repository responsible for theme settings.
  final SettingsRepository repository;

  /// Constructs a [GetTheme] use case with a required [SettingsRepository].
  GetTheme({required this.repository});

  /// It calls the getTheme method on the settings repository and
  /// returns the result, that will complete with either a [Failure] or [Theme].
  @override
  Future<Either<Failure, Theme>> call(NoParams params) => repository.getTheme();
}
