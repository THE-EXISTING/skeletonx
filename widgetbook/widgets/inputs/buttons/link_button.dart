import '../../../widgetbook.dart';

class LinkButtonBook {
  static List<WidgetbookUseCase> createCases() {
    return [
      WidgetbookUseCase(
        name: 'Link Primary Button',
        builder: (context) => ContainerLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          padding: PaddingSpace.all16,
          children: [
            AppLinkButton(
              onPressed: () {},
              size: AppWidgetSize.sm,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
            AppLinkButton(
              onPressed: () {},
              size: AppWidgetSize.md,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
            AppLinkButton(
              onPressed: () {},
              size: AppWidgetSize.lg,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
            AppLinkButton(
              onPressed: () {},
              size: AppWidgetSize.xl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
            AppLinkButton(
              onPressed: () {},
              size: AppWidgetSize.xxl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
          ],
        ),
      ),
      WidgetbookUseCase(
        name: 'Link Secondary Button',
        builder: (context) => ContainerLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          padding: PaddingSpace.all16,
          children: [
            AppLinkSecondaryButton(
              onPressed: () {},
              size: AppWidgetSize.sm,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
            AppLinkSecondaryButton(
              onPressed: () {},
              size: AppWidgetSize.md,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
            AppLinkSecondaryButton(
              onPressed: () {},
              size: AppWidgetSize.lg,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
            AppLinkSecondaryButton(
              onPressed: () {},
              size: AppWidgetSize.xl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
            AppLinkSecondaryButton(
              onPressed: () {},
              size: AppWidgetSize.xxl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
          ],
        ),
      ),
      WidgetbookUseCase(
        name: 'Link Gray Button',
        builder: (context) => ContainerLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          padding: PaddingSpace.all16,
          children: [
            AppLinkGrayButton(
              onPressed: () {},
              size: AppWidgetSize.sm,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
            AppLinkGrayButton(
              onPressed: () {},
              size: AppWidgetSize.md,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
            AppLinkGrayButton(
              onPressed: () {},
              size: AppWidgetSize.lg,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
            AppLinkGrayButton(
              onPressed: () {},
              size: AppWidgetSize.xl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
            AppLinkGrayButton(
              onPressed: () {},
              size: AppWidgetSize.xxl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              destructive: ButtonBook.createDestructiveButtonOption(context),
            ),
          ],
        ),
      ),
    ];
  }
}
