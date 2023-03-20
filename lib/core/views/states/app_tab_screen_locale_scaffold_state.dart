import 'package:skeletonx/core/core.dart';

abstract class AppTabScreenLocaleScaffoldState<T extends StatefulWidgetX>
    extends TabScreenScaffoldStateX<T> {

  // ignore: non_constant_identifier_names
  AppLocalizations get Strings => AppLocalizations.of(context)!;
}
