import 'package:skeletonx/core/core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class AppScreenLocaleScaffoldBlocState<T extends StatefulWidgetX,
    B extends BlocBase<S>, S> extends ScreenScaffoldBlocStateX<T, B, S> {
  // ignore: non_constant_identifier_names
  AppLocalizations get Strings => AppLocalizations.of(context)!;

  @override
  void onExceptionBloc(context, exception) {
    // TODO: Handle common exception here.
    super.onExceptionBloc(context, exception);
  }
}
