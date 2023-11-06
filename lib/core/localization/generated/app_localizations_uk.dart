import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get helloThere => 'Привіт';

  @override
  String language(String language) {
    String _temp0 = intl.Intl.selectLogic(
      language,
      {
        'en': 'Англійська',
        'uk': 'Українська',
        'other': 'Інша',
      },
    );
    return '$_temp0';
  }

  @override
  String get en => 'Англійська';

  @override
  String get settings => 'Налаштування';

  @override
  String get darkMode => 'Темна тема';

  @override
  String get colors => 'Кольори';
}
