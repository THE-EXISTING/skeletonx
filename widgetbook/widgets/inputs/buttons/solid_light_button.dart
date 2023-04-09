import '../../../widgetbook.dart';

class SolidLightButtonBook {
  static List<WidgetbookUseCase> createCases() {
    return [
      WidgetbookUseCase(
        name: 'Solid Primary Light Button',
        builder: (context) => ContainerLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          padding: PaddingSpace.all16,
          children: [
            AppSolidLightButton(
              onPressed: () {},
              size: AppWidgetSize.sm,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
              expanded: ButtonBook.createExpandedButtonOption(context),
            ),
            AppSolidLightButton(
              onPressed: () {},
              size: AppWidgetSize.md,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
              expanded: ButtonBook.createExpandedButtonOption(context),
            ),
            AppSolidLightButton(
              onPressed: () {},
              size: AppWidgetSize.lg,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
              expanded: ButtonBook.createExpandedButtonOption(context),
            ),
            AppSolidLightButton(
              onPressed: () {},
              size: AppWidgetSize.xl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
              expanded: ButtonBook.createExpandedButtonOption(context),
            ),
            AppSolidLightButton(
              onPressed: () {},
              size: AppWidgetSize.xxl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
              expanded: ButtonBook.createExpandedButtonOption(context),
            ),
          ],
        ),
      ),
      WidgetbookUseCase(
        name: 'Solid Secondary Light Button',
        builder: (context) => Wrap(
          direction: Axis.vertical,
          spacing: 20,
          children: [
            AppSolidLightSecondaryButton(
              onPressed: () {},
              size: AppWidgetSize.sm,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
              expanded: ButtonBook.createExpandedButtonOption(context),
            ),
            AppSolidLightSecondaryButton(
              onPressed: () {},
              size: AppWidgetSize.md,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
              expanded: ButtonBook.createExpandedButtonOption(context),
            ),
            AppSolidLightSecondaryButton(
              onPressed: () {},
              size: AppWidgetSize.lg,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
              expanded: ButtonBook.createExpandedButtonOption(context),
            ),
            AppSolidLightSecondaryButton(
              onPressed: () {},
              size: AppWidgetSize.xl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
              expanded: ButtonBook.createExpandedButtonOption(context),
            ),
            AppSolidLightSecondaryButton(
              onPressed: () {},
              size: AppWidgetSize.xxl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
              expanded: ButtonBook.createExpandedButtonOption(context),
            ),
          ],
        ),
      ),
    ];
  }
}
