import 'package:color_generator/core/core.dart';
import 'package:color_generator/features/settings/domain/entities/theme/theme.dart';
import 'package:color_generator/features/settings/domain/repositories/settings_repository.dart';
import 'package:color_generator/features/settings/domain/usecases/change_locale.dart';
import 'package:color_generator/utils/services/hive/main_box_mixin.dart';
import 'package:dartz/dartz.dart';

/// Implementation of the settings repository.
class SettingsRepositoryImpl implements SettingsRepository {
  /// The main box mixin used for storing settings.
  final MainBoxMixin mainBoxMixin;

  /// Creates a [SettingsRepositoryImpl] with the given [mainBoxMixin].
  SettingsRepositoryImpl({required this.mainBoxMixin});

  @override
  Future<Either<Failure, Theme>> getTheme() async {
    try {
      final String saved = mainBoxMixin.getData(MainBoxKeys.theme)
          ?? ActiveTheme.system.name;

      final ActiveTheme activeTheme = ActiveTheme.values.singleWhere(
        (theme) => theme.name == saved,
      );

      return Right(Theme(themeMode: activeTheme));
    } catch (e) {
      return Left(NoDataFailure());
    }
  }

  @override
  Future<Either<Failure, Theme>> changeTheme() async {
    final String activeTheme = mainBoxMixin.getData(MainBoxKeys.theme)
        ?? ActiveTheme.system.name;

    return activeTheme == ActiveTheme.dark.name
        ? setLightTheme()
        : setDarkTheme();
  }

  @override
  Future<Either<Failure, Theme>> setLightTheme() async {
    try {
      await mainBoxMixin.addData(MainBoxKeys.theme, ActiveTheme.light.name);

      return const Right(Theme(themeMode: ActiveTheme.light));
    } catch (e) {
      return Left(NoDataFailure());
    }
  }

  @override
  Future<Either<Failure, Theme>> setDarkTheme() async {
    try {
      await mainBoxMixin.addData(MainBoxKeys.theme, ActiveTheme.dark.name);

      return const Right(Theme(themeMode: ActiveTheme.dark));
    } catch (e) {
      return Left(NoDataFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getLocale() async {
    try {
      final String languageCode = mainBoxMixin.getData(MainBoxKeys.locale);

      return Right(languageCode);
    } catch (e) {
      return Left(NoDataFailure());
    }
  }

  @override
  Future<Either<Failure, String>> changeLocale(LocaleParams params) async {
    try {
      await mainBoxMixin.addData(MainBoxKeys.locale, params.languageCode);

      return Right(params.languageCode);
    } catch (e) {
      return Left(NoDataFailure());
    }
  }
}
