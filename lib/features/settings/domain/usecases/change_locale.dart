import 'package:color_generator/core/core.dart';
import 'package:color_generator/core/usecase/usecase.dart';
import 'package:color_generator/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_locale.freezed.dart';

/// A use case for changing the application locale.
///
/// This class encapsulates the logic for changing the locale by
/// delegating to the [SettingsRepository].
class ChangeLocale extends UseCase<String, LocaleParams> {
  /// The repository responsible for theme settings.
  final SettingsRepository repository;

  /// Constructs a [ChangeLocale] use case with the given [SettingsRepository].
  ChangeLocale({required this.repository});

  /// Calls the changeLocale method on the [repository]
  /// with the provided [LocaleParams].
  ///
  /// Returns a [Failure] or a success message as a [String].
  @override
  Future<Either<Failure, String>> call(LocaleParams params) {
    return repository.changeLocale(params);
  }
}

/// Represents the parameters required to change the application locale.
@freezed
class LocaleParams with _$LocaleParams {
  /// A factory constructor to create [LocaleParams] with a [languageCode].
  const factory LocaleParams({required String languageCode}) = _LocaleParams;
}
