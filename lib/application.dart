import 'package:color_generator/core/core.dart';
import 'package:color_generator/features/settings/view/cubit/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A stateless widget that represents the root of the application.
///
/// This widget is responsible for building the main application structure
/// like theming, localization, navigation based on the current settings state.
class Application extends StatelessWidget {

  /// Constructs the [Application] widget.
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return CupertinoApp.router(
          // Removes the debug banner from the app.
          debugShowCheckedModeBanner: false,
          // Sets the locale of the app based on the settings state.
          locale: Locale(state.locale),
          // Specifies the supported locales for the app.
          supportedLocales: AppLocalizations.supportedLocales,
          // Sets up the localizations delegates for the app.
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          // Defines the router configuration for the app navigation.
          routerConfig: Navigation.router,
          // Applies the theme based on the settings state, choosing between
          // a light or dark Cupertino theme.
          theme: state.isDarkTheme
              ? ApplicationTheme.cupertinoDark()
              : ApplicationTheme.cupertinoLight(),
        );
      },
    );
  }
}
