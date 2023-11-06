import 'package:color_generator/core/localization/generated/app_localizations.dart';
import 'package:color_generator/core/resources/palette.dart';
import 'package:color_generator/dependencies_injection.dart';
import 'package:color_generator/features/authentication/view/cubit/auth_cubit.dart';
import 'package:color_generator/features/settings/view/cubit/settings_cubit.dart';
import 'package:color_generator/features/settings/view/widgets/language_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A stateless widget that provides the settings screen for the application.
///
/// This screen allows users to change app settings such as theme and language.
class SettingScreen extends StatelessWidget {
  /// Default [SettingScreen] widget constructs.
  const SettingScreen({super.key});

  @override
  /// Builds the widget tree for the settings screen.
  ///
  /// Uses [BlocBuilder] to listen to [SettingsCubit] for state changes and
  /// build the UI accordingly with settings options like theme and language.
  Widget build(BuildContext context) {
    // Acquire the SettingsCubit from the context for state management.
    final SettingsCubit cubit = context.read<SettingsCubit>();

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return CupertinoPageScaffold(
          backgroundColor: CupertinoColors.systemGroupedBackground,
          navigationBar: CupertinoNavigationBar(
            middle: Text(
                AppLocalizations.of(context)?.settings ?? 'Settings',
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: sl<AuthCubit>().logout,
              child: const Icon(CupertinoIcons.square_arrow_right),
            ),
          ),
          // Main content of settings screen.
          child: Center(
            child: ListView(
              children: [
                // List section for settings options.
                CupertinoListSection.insetGrouped(
                  children: [
                    // Toggle for dark mode setting.
                    CupertinoListTile(
                      leading: Icon(
                        state.isDarkTheme
                            ? CupertinoIcons.moon_fill
                            : CupertinoIcons.sun_max_fill,
                      ),
                      title: Text(
                        AppLocalizations.of(context)?.darkMode ?? 'Dark mode',
                      ),
                      trailing: CupertinoSwitch(
                        value: state.isDarkTheme,
                        onChanged: (value) => cubit.onChangeTheme(),
                        activeColor: CupertinoColors.activeGreen,
                      ),
                    ),
                    // Picker for language selection.
                    const CupertinoListTile(
                      leading: Icon(CupertinoIcons.textformat),
                      title: LanguagePicker(),
                      trailing: Icon(
                        CupertinoIcons.hand_draw_fill,
                        color: Palette.lightGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
