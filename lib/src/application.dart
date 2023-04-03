import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/core/routes/routes.dart';
import 'package:skeletonx/localization/l10n.dart';
import 'package:skeletonx/src/features/settings/setting_model.dart';
import 'features/settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApplication extends ApplicationX {
  MyApplication(
      {SettingsController? settingsController, this.widget, this.testSetting})
      : super(key: const Key('MyApplication')) {
    this.settingsController = settingsController ?? SettingsController.instance;
  }

  static AppHttpClient get httpClient => AppHttpClient.instance;

  late final SettingsController settingsController;
  late final Widget? widget;
  late final SettingModel? testSetting;

  @override
  State<StatefulWidget> createState() => _MyApplication();

  @override
  Future<void> setupApplication() async {
    // await SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    httpClient.setupBaseUrl(AppConfig.apiBaseUrl);
  }
}

class _MyApplication extends ApplicationLocaleState<MyApplication> {
  @override
  void onDeeplinkUri(Uri uri) {
    // TODO: implement onDeeplinkUri
    if (uri.path == '/link/') {
      return;
    }
    super.onDeeplinkUri(uri);
  }

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: widget.settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          debugShowCheckedModeBanner: false,
          restorationScopeId: restorationId,
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          locale:
              widget.testSetting?.locale ?? widget.settingsController.locale,
          localeResolutionCallback: L10n.localeResolutionCallback,

          onGenerateTitle: (BuildContext context) =>
              AppEnvironment.instance.appName,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: widget.settingsController.themeMode,

          routerConfig: router,

          builder: (context, child) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              maxWidth: AppBreakpoint.contentMax,
              minWidth: AppBreakpoint.contentMin,
              breakpoints: [
                const ResponsiveBreakpoint.resize(
                  AppBreakpoint.mobileMax,
                  name: MOBILE,
                ),
                const ResponsiveBreakpoint.autoScale(
                  AppBreakpoint.tabletMax,
                  name: TABLET,
                ),
                const ResponsiveBreakpoint.resize(
                  AppBreakpoint.desktopMax,
                  name: DESKTOP,
                ),
                const ResponsiveBreakpoint.resize(
                  AppBreakpoint.desktopLgMax,
                  name: '4K',
                ),
              ],
              background: Container(color: AppColors.surface.light)),
        );
      },
    );
  }
}
