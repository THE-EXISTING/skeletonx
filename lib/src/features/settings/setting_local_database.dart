import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/localization/l10n.dart';
import 'package:skeletonx/src/features/settings/setting_model.dart';

// ============ Singleton ========= //
class SettingDatabase extends AppSecureLocalDatabase {
  const SettingDatabase();

  static const String localeKey = 'LOCALE_KEY';
  static const String themeKey = 'THEME_KEY';

  Future<ThemeMode> get theme => _loadTheme();

  Future<Locale> get locale => _loadLocale();

  Future<SettingModel> get setting async {
    ThemeMode theme = await _loadTheme();
    Locale locale = await _loadLocale();
    return SettingModel(locale: locale, themeMode: theme);
  }

  Future<Locale> _loadLocale() async {
    final String localeStr = await load(key: localeKey);

    Locale appLocale;
    if (localeStr.isEmpty) {
      // First time when start app
      appLocale = L10n.initLocale;
      await saveLocale(locale: appLocale);
    } else {
      appLocale = Locale(localeStr);
    }
    return appLocale;
  }

  Future<ThemeMode> _loadTheme() async {
    final String themeStr = await load(key: themeKey);

    ThemeMode theme;
    if (themeStr.isEmpty) {
      // First time when start app
      theme = ThemeMode.system;
      await saveTheme(theme: theme);
    } else {
      theme = themeStr.toEnum(ThemeMode.values);
    }
    return theme;
  }

  Future<void> saveLocale({required Locale locale}) async {
    final String language = locale.languageCode;
    await save(key: localeKey, data: language);
  }

  Future<void> saveTheme({required ThemeMode? theme}) async {
    final String themeStr = theme.toString();
    await save(key: themeKey, data: themeStr);
  }
}
