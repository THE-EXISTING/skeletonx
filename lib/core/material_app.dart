import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/core/routes/routes.dart';
import 'package:skeletonx/localization/l10n.dart';
import 'package:skeletonx/src/features/settings/setting_model.dart';
import '../src/features/settings/settings_controller.dart';

/// The Widget that configures your application.
class AppMaterialRoute extends StatefulWidget {
  const AppMaterialRoute({
    Key? key,
    this.scaffoldMessengerKey,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.routerConfig,
    this.backButtonDispatcher,
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.themeAnimationDuration = kThemeAnimationDuration,
    this.themeAnimationCurve = Curves.linear,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.useInheritedMediaQuery = false,
  }) : super(key: key);

  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final RouterConfig<Object>? routerConfig;
  final BackButtonDispatcher? backButtonDispatcher;
  final TransitionBuilder? builder;
  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final AppThemeData? theme;
  final AppThemeData? darkTheme;
  final AppThemeData? highContrastTheme;
  final AppThemeData? highContrastDarkTheme;
  final ThemeMode? themeMode;
  final Duration themeAnimationDuration;
  final Curve themeAnimationCurve;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool debugShowMaterialGrid;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final String? restorationScopeId;
  final ScrollBehavior? scrollBehavior;
  final bool useInheritedMediaQuery;

  @override
  State<StatefulWidget> createState() => _AppMaterialRoute();
}

class _AppMaterialRoute extends State<AppMaterialRoute> {
  @override
  Widget build(BuildContext context) {
    return AppTheme(
      theme: widget.theme,
      themeMode: widget.themeMode,
      child: MaterialApp.router(
        scaffoldMessengerKey: widget.scaffoldMessengerKey,
        routeInformationProvider: widget.routeInformationProvider,
        routeInformationParser: widget.routeInformationParser,
        routerDelegate: widget.routerDelegate,
        routerConfig: widget.routerConfig,
        backButtonDispatcher: widget.backButtonDispatcher,
        builder: widget.builder,
        title: widget.title,
        onGenerateTitle: widget.onGenerateTitle,
        color: widget.color,
        theme: widget.theme?.toThemeData(),
        darkTheme: widget.darkTheme?.toThemeData(),
        highContrastTheme: widget.highContrastTheme?.toThemeData(),
        highContrastDarkTheme: widget.highContrastDarkTheme?.toThemeData(),
        themeMode: widget.themeMode,
        themeAnimationDuration: widget.themeAnimationDuration,
        themeAnimationCurve: widget.themeAnimationCurve,
        locale: widget.locale,
        localizationsDelegates: widget.localizationsDelegates,
        localeListResolutionCallback: widget.localeListResolutionCallback,
        localeResolutionCallback: widget.localeResolutionCallback,
        supportedLocales: widget.supportedLocales,
        debugShowMaterialGrid: widget.debugShowMaterialGrid,
        showPerformanceOverlay: widget.showPerformanceOverlay,
        checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
        showSemanticsDebugger: widget.showSemanticsDebugger,
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
        shortcuts: widget.shortcuts,
        actions: widget.actions,
        restorationScopeId: widget.restorationScopeId,
        scrollBehavior: widget.scrollBehavior,
        useInheritedMediaQuery: widget.useInheritedMediaQuery,
      ),
    );
  }
}

class AppTheme extends InheritedWidget {
  const AppTheme({
    Key? key,
    required this.theme,
    this.darkTheme,
    required this.themeMode,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  final AppThemeData? theme;
  final AppThemeData? darkTheme;
  final ThemeMode? themeMode;

  static AppThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (widget?.darkTheme == null) return widget!.theme!;

    if (widget?.themeMode == ThemeMode.dark) {
      return widget!.darkTheme!;
    } else {
      return widget!.theme!;
    }
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return theme != oldWidget.theme;
  }
}
