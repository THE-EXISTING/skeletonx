import 'package:falconx/falconx.dart';

class SettingModel extends ModelX {
  SettingModel({required this.locale, required this.themeMode});

  final Locale locale;
  final ThemeMode themeMode;

  @override
  copyWith({Locale? locale, ThemeMode? themeMode}) => SettingModel(
      locale: locale ?? this.locale, themeMode: themeMode ?? this.themeMode);

  @override
  // TODO: implement props
  List<Object?> get props => [locale, themeMode];
}
