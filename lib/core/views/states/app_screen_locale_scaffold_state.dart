import 'package:skeletonx/core/core.dart';

abstract class AppScreenLocaleScaffoldState<T extends StatefulWidgetX>
    extends ScreenScaffoldStateX<T> {

  // ignore: non_constant_identifier_names
  AppLocalizations get Strings => AppLocalizations.of(context)!;

  AppThemeData get theme => AppTheme.of(context);

}
