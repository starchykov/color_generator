import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloThere => 'Hello there';

  @override
  String language(String language) {
    String _temp0 = intl.Intl.selectLogic(
      language,
      {
        'en': 'English',
        'uk': 'Ukrainian',
        'other': 'Other',
      },
    );
    return '$_temp0';
  }

  @override
  String get en => 'English';

  @override
  String get settings => 'Settings';

  @override
  String get darkMode => 'Dark mode';

  @override
  String get colors => 'Colors';
}
