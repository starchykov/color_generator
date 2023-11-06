import 'package:color_generator/core/core.dart';
import 'package:color_generator/core/usecase/usecase.dart';
import 'package:color_generator/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

/// A use case that gets the current locale from the [SettingsRepository].
class GetLocale extends UseCase<String, NoParams> {
  /// The repository where settings data is stored.
  final SettingsRepository repository;

  /// Constructs a [GetLocale] use case with the necessary [SettingsRepository].
  GetLocale({required this.repository});

  /// Calls the getLocale method from the [repository]
  /// to get the current locale.
  ///
  /// Returns a [Failure] or the current locale as a [String].
  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return repository.getLocale();
  }
}
