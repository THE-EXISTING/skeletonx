import 'package:flutter/material.dart';
import 'package:skeletonx/src/features/settings/setting_local_database.dart';
import 'package:skeletonx/src/features/settings/setting_model.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsController with ChangeNotifier {
  factory SettingsController() => instance;

  SettingsController._({
    SettingDatabase database = const SettingDatabase(),
  }) : _database = database;

  static final SettingsController instance = SettingsController._();

  late SettingDatabase _database;

  late SettingModel _setting;

  ThemeMode get themeMode => _setting.themeMode;

  Locale get locale => _setting.locale;

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    _setting = await _database.setting;
    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateSettings(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _setting.themeMode) return;
    _setting = _setting.copyWith(themeMode: newThemeMode);
    notifyListeners();
    await _database.saveTheme(theme: newThemeMode);
  }
}
