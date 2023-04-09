import '../../../widgetbook.dart';

class GhostButtonBook {
  static List<WidgetbookUseCase> createCases() {
    return [
      WidgetbookUseCase(
        name: 'Ghost Primary Button',
        builder: (context) => ContainerLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          padding: PaddingSpace.all16,
          children: [
            AppGhostButton(
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
            AppGhostButton(
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
            AppGhostButton(
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
            AppGhostButton(
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
            AppGhostButton(
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
        name: 'Ghost Secondary Button',
        builder: (context) => ContainerLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          padding: PaddingSpace.all16,
          children: [
            AppGhostSecondaryButton(
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
            AppGhostSecondaryButton(
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
            AppGhostSecondaryButton(
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
            AppGhostSecondaryButton(
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
            AppGhostSecondaryButton(
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
        name: 'Ghost Gray Button',
        builder: (context) => ContainerLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          padding: PaddingSpace.all16,
          children: [
            AppGhostGrayButton(
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
            AppGhostGrayButton(
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
            AppGhostGrayButton(
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
            AppGhostGrayButton(
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
            AppGhostGrayButton(
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
