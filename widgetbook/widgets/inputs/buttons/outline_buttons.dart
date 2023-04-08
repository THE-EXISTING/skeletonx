import '../../../widgetbook.dart';

class OutlineButtonBook extends ButtonBook {
  static List<WidgetbookUseCase> createCases() {
    return [
      WidgetbookUseCase(
        name: 'Outline Primary Button',
        builder: (context) => Wrap(
          direction: Axis.vertical,
          spacing: 20,
          children: [
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlinePrimary,
              size: AppWidgetSize.sm,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlinePrimary,
              size: AppWidgetSize.md,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlinePrimary,
              size: AppWidgetSize.lg,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlinePrimary,
              size: AppWidgetSize.xl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlinePrimary,
              size: AppWidgetSize.xxl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
          ],
        ),
      ),
      WidgetbookUseCase(
        name: 'Outline Secondary Button',
        builder: (context) => Wrap(
          direction: Axis.vertical,
          spacing: 20,
          children: [
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlineSecondary,
              size: AppWidgetSize.sm,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlineSecondary,
              size: AppWidgetSize.md,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlineSecondary,
              size: AppWidgetSize.lg,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlineSecondary,
              size: AppWidgetSize.xl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlineSecondary,
              size: AppWidgetSize.xxl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
          ],
        ),
      ),
      WidgetbookUseCase(
        name: 'Outline Gray Button',
        builder: (context) => Wrap(
          direction: Axis.vertical,
          spacing: 20,
          children: [
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlineGray,
              size: AppWidgetSize.sm,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlineGray,
              size: AppWidgetSize.md,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlineGray,
              size: AppWidgetSize.lg,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlineGray,
              size: AppWidgetSize.xl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.outlineGray,
              size: AppWidgetSize.xxl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
          ],
        ),
      ),
    ];
  }
}
