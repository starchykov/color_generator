import 'package:color_generator/core/core.dart';
import 'package:color_generator/features/settings/view/cubit/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A custom widget that creates a language picker.
class LanguagePicker extends StatelessWidget {
  /// Default [LanguagePicker] widget constructs.
  const LanguagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    // Acquire the SettingsCubit from the context for state management.
    final SettingsCubit cubit = context.read<SettingsCubit>();

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return CupertinoPicker(
          itemExtent: Sizes.p32,
          selectionOverlay: Container(),
          scrollController: FixedExtentScrollController(
            initialItem: state.localeId,
          ),
          onSelectedItemChanged: (int selectedLocale) {
            cubit.onChangeLocale(id: selectedLocale);
          },
          children: AppLocalizations.supportedLocales.map((e) {
            final String lan = e.languageCode;

            return Row(
              children: [
                Text(
                  AppLocalizations.of(context)?.language(lan) ?? lan,
                  style: CupertinoTheme.of(context).textTheme.textStyle,
                ),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
