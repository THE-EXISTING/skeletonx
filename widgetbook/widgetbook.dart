import 'package:skeletonx/core/core.dart';
import 'package:widgetbook/widgetbook.dart';
import 'config.dart';
import 'widgets/widgets.dart';

class WidgetbookHotReload extends StatelessWidget {
  WidgetbookHotReload({Key? key}) : super(key: key);

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
            ButtonBook.createSolidButton(),
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
