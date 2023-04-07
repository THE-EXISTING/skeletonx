import 'package:skeletonx/core/core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class L10n {
  static const en = Locale('en', '');
  static const th = Locale('th', '');

  static Locale get initLocale {
    String currentLocaleStr = Platform.localeName.split('_')[0];
    Locale? selectLocale = supportedLocales
        .firstOrNullWhere((locale) => locale.languageCode == currentLocaleStr);
    if (selectLocale != null) {
      return selectLocale;
    } else {
      return en;
    }
  }

  static final supportedLocales = [en, th];

  // Provide the generated AppLocalizations to the MaterialApp. This
  // allows descendant Widgets to display the correct translations
  // depending on the user's locale.

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static Locale? localeResolutionCallback(
      Locale? locale, Iterable<Locale> supportedLocales) {
    Log.i('Change language');
    return locale;
  }
}
