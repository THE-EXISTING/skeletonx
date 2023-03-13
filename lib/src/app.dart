import 'package:falconx/falconx.dart';
import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/localization/l10n.dart';
import 'package:skeletonx/src/features/settings/setting_model.dart';
import 'features/settings/settings_view.dart';
import 'features/settings/settings_controller.dart';
import 'features/sample_feature/sample_item_details_view.dart';
import 'features/sample_feature/sample_item_list_view.dart';

/// The Widget that configures your application.
class MyApplication extends ApplicationX {
  MyApplication(
      {SettingsController? settingsController, this.widget, this.testSetting})
      : super(key: const Key('MyApplication')) {
    this.settingsController = settingsController ?? SettingsController.instance;
  }

  late final SettingsController settingsController;
  late final Widget? widget;
  late final SettingModel? testSetting;

  @override
  State<StatefulWidget> createState() => _MyApplication();
}

class _MyApplication extends LocaleStateX<MyApplication> {
  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: widget.settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: restorationId,
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          locale:
              widget.testSetting?.locale ?? widget.settingsController.locale,
          localeResolutionCallback: L10n.localeResolutionCallback,

          onGenerateTitle: (BuildContext context) =>
              getStrings(context).appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: widget.settingsController.themeMode,

          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: widget.settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SampleItemListView.routeName:
                  default:
                    return const SampleItemListView();
                }
              },
            );
          },
        );
      },
    );
  }
}
