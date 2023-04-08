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
      ],
      directories: [
        WidgetbookCategory(
          name: 'Inputs',
          children: [
            ButtonBook.createBook(),
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
    );
  }
}
