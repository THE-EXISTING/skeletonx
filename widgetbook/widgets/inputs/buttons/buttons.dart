import '../../../widgetbook.dart';
export 'outline_buttons.dart';
export 'solid_button.dart';
export 'solid_light_button.dart';
export 'ghost_button.dart';
export 'link_button.dart';
export 'groups/groups.dart';

class ButtonBook {
  static WidgetbookComponent createBook() {
    return WidgetbookComponent(name: 'Button', useCases: [
      ...SolidButtonBook.createCases(),
      ...SolidLightButtonBook.createCases(),
      ...OutlineButtonBook.createCases(),
      ...GhostButtonBook.createCases(),
      ...LinkButtonBook.createCases(),
    ]);
  }

  ///========================= OPTIONS =========================///
  static String? createIconButtonOption(BuildContext context, String label) =>
      context.knobs.options(label: label, options: [
        Assets.iconCircle,
        null,
      ]);

  static String createTextButtonOption(BuildContext context) =>
      context.knobs.text(label: 'Text', initialValue: 'Button Text');

  static bool createEnabledButtonOption(BuildContext context) =>
      context.knobs.boolean(label: 'Enable', initialValue: true);

  static bool createDestructiveButtonOption(BuildContext context) =>
      context.knobs.boolean(label: 'Destructive', initialValue: false);

  static bool createExpandedButtonOption(BuildContext context) =>
      context.knobs.boolean(label: 'Expanded', initialValue: false);

}
