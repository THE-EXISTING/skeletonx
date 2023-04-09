import 'package:skeletonx/core/core.dart';

abstract class AppLocaleState<T extends StatefulWidgetX> extends StateX<T> {
  // ignore: non_constant_identifier_names
  AppLocalizations get Strings => AppLocalizations.of(context)!;

  AppLocalizations getStrings(BuildContext context) =>
      AppLocalizations.of(context)!;

  AppThemeData get theme => AppTheme.of(context);
}
