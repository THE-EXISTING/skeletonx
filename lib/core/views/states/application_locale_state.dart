import 'package:falconx/falconx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class ApplicationLocaleState<T extends StatefulWidgetX>
    extends ApplicationStateX<T> {
  // ignore: non_constant_identifier_names
  AppLocalizations get Strings => AppLocalizations.of(context)!;

  AppLocalizations getStrings(BuildContext context) =>
      AppLocalizations.of(context)!;
}
