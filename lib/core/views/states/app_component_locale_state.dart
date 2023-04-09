import 'package:skeletonx/core/core.dart';


abstract class AppComponentGroupLocaleState<T extends StatefulWidgetX>
    extends ComponentStateX<T> {
  AppComponentGroupLocaleState({ViewState? viewState}) : super(viewState: viewState);

  // ignore: non_constant_identifier_names
  AppLocalizations get Strings => AppLocalizations.of(context)!;

  AppThemeData get theme => AppTheme.of(context);

}
