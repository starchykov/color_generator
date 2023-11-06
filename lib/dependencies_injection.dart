import 'package:color_generator/features/authentication/data/providers/providers.dart';
import 'package:color_generator/features/authentication/data/repositories/login_repository_impl.dart';
import 'package:color_generator/features/authentication/domain/repositories/login_repository.dart';
import 'package:color_generator/features/authentication/domain/usecases/post_login.dart';
import 'package:color_generator/features/authentication/view/cubit/auth_cubit.dart';
import 'package:color_generator/features/color_generator/cubit/color_generator_cubit.dart';
import 'package:color_generator/features/home/cubit/home_screen_cubit.dart';
import 'package:color_generator/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:color_generator/features/settings/domain/repositories/settings_repository.dart';
import 'package:color_generator/features/settings/domain/usecases/change_locale.dart';
import 'package:color_generator/features/settings/domain/usecases/change_theme.dart';
import 'package:color_generator/features/settings/domain/usecases/get_locale.dart';
import 'package:color_generator/features/settings/domain/usecases/get_theme.dart';
import 'package:color_generator/features/settings/view/cubit/settings_cubit.dart';
import 'package:color_generator/utils/utils.dart';
import 'package:get_it/get_it.dart';

/// A global instance of `GetIt` (Service Locator) for accessing services
/// throughout the application.
final GetIt sl = GetIt.instance;

/// Initializes dependencies for the application.
/// It sequentially initializes Hive boxes, providers, repositories,
/// use cases, and cubits.
Future<void> initialize() async {
  await _initHiveBoxes();
  _providers();
  _repositories();
  _useCases();
  _cubits();
}

/// Initializes Hive boxes and registers them in the service locator.
Future<void> _initHiveBoxes() async {
  await MainBoxMixin.initHive();
  sl.registerSingleton<MainBoxMixin>(MainBoxMixin());
}

/// Registers all the providers as lazy singletons in the service locator.
void _providers() {
  sl.registerLazySingleton<AuthProvider>(AuthProviderIml.new);
}

/// Registers all the repositories as lazy singletons in the service locator.
void _repositories() {
  sl.registerLazySingleton<LoginRepository>(() {
    return LoginRepositoryImpl(provider: sl(), mainBoxMixin: sl());
  });
  sl.registerLazySingleton<SettingsRepository>(() {
    return SettingsRepositoryImpl(mainBoxMixin: sl());
  });
}

/// Registers use cases related to the application logic as lazy singletons
/// in the service locator.
void _useCases() {
  // Authentication use cases
  sl.registerLazySingleton<PostLogin>(() => PostLogin(repository: sl()));

  // Settings use cases
  sl.registerLazySingleton<GetTheme>(() => GetTheme(repository: sl()));
  sl.registerLazySingleton<ChangeTheme>(() => ChangeTheme(repository: sl()));
  sl.registerLazySingleton<GetLocale>(() => GetLocale(repository: sl()));
  sl.registerLazySingleton<ChangeLocale>(() => ChangeLocale(repository: sl()));
}

/// Registers all cubits as lazy singletons or factories in the service locator.
void _cubits() {
  // Authentication cubits
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(postLogin: sl()));

  // Settings cubits
  sl.registerLazySingleton<SettingsCubit>(() {
    return SettingsCubit(
      changeLocale: sl(),
      getLocale: sl(),
      changeTheme: sl(),
      getTheme: sl(),
    );
  });

  // HomeScreen cubit
  sl.registerLazySingleton<HomeScreenCubit>(HomeScreenCubit.new);

  // Color generator. ColorGeneratorCubit is disposed of during the lifecycle
  // and should be recreated.
  sl.registerFactory<ColorGeneratorCubit>(ColorGeneratorCubit.new);
}
