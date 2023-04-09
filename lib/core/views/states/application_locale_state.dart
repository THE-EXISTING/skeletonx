import 'package:skeletonx/core/core.dart';

abstract class ApplicationLocaleState<T extends StatefulWidgetX>
    extends ApplicationStateX<T> {
  // ignore: non_constant_identifier_names
  AppLocalizations get Strings => AppLocalizations.of(context)!;

  AppLocalizations getStrings(BuildContext context) =>
      AppLocalizations.of(context)!;

  AppThemeData get theme => AppTheme.of(context);

}
