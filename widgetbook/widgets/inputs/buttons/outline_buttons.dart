import '../../../widgetbook.dart';

class OutlineButtonBook extends ButtonBook {
  static List<WidgetbookUseCase> createCases() {
    return [
      WidgetbookUseCase(
        name: 'Outline Primary Button',
        builder: (context) => ContainerLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          padding: PaddingSpace.all16,
          children: [
            AppOutlineButton(
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
            AppOutlineButton(
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
            AppOutlineButton(
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
            AppOutlineButton(
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
            AppOutlineButton(
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
        name: 'Outline Secondary Button',
        builder: (context) =>ContainerLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          padding: PaddingSpace.all16,
          children: [
            AppOutlineSecondaryButton(
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
            AppOutlineSecondaryButton(
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
            AppOutlineSecondaryButton(
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
            AppOutlineSecondaryButton(
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
            AppOutlineSecondaryButton(
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
        name: 'Outline Gray Button',
        builder: (context) => ContainerLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          padding: PaddingSpace.all16,
          children: [
            AppOutlineGrayButton(
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
            AppOutlineGrayButton(
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
            AppOutlineGrayButton(
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
            AppOutlineGrayButton(
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
            AppOutlineGrayButton(
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
