export 'package:skeletonx/core/core.dart';
export 'package:widgetbook/widgetbook.dart' hide Frame;
export 'widgets/widgets.dart';
export 'config.dart';

import 'package:skeletonx/core/core.dart';
import 'package:widgetbook/widgetbook.dart';
import 'config.dart';
import 'widgets/widgets.dart';

class AppWidgetbookHotReload extends StatelessWidget {
  const AppWidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        FrameAddon(
          setting:
              FrameSetting.firstAsSelected(frames: WidgetBookConfig.frames),
        ),
        CustomThemeAddon(
          setting: CustomThemeSetting.firstAsSelected(
            themes: WidgetBookConfig.themes,
          ),
        ),
        MaterialThemeAddon(
          setting: MaterialThemeSetting.firstAsSelected(
            themes: WidgetBookConfig.materialThemes,
          ),
        ),
      ],
      directories: [
        WidgetbookCategory(
          name: 'Inputs',
          children: [
            ButtonBook.createBook(),
            ButtonGroupBook.createBook(),
          ],
        ),
        WidgetbookCategory(
          name: 'Displays',
          children: [],
        ),
        WidgetbookCategory(
          name: 'Tables',
          children: [],
        ),
        WidgetbookCategory(
          name: 'Visualizes',
          children: [],
        ),
      ],
      appBuilder: appBuilder,
    );
  }
}


get appBuilder => (BuildContext context, Widget child) {
      final builder = Builder(
        builder: (context) {
          return AppTheme(
            theme: AppConfig.theme.lightTheme,
            darkTheme: AppConfig.theme.darkTheme,
            themeMode: ThemeMode.system,
            child: MaterialApp(
              theme: context.materialTheme,
              locale: context.localization?.activeLocale,
              supportedLocales: context.localization?.locales ??
                  const <Locale>[
                    Locale('en', 'US'),
                  ],
              localizationsDelegates:
                  context.localization?.localizationsDelegates,
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: context.textScale,
                  ),
                  child: child,
                ),
              ),
            ),
          );
        },
      );
      final frameBuilder = context.frameBuilder;
      return frameBuilder == null
          ? builder
          : frameBuilder(
              context,
              builder,
            );
    };
