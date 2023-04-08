import '../../../widgetbook.dart';

class GhostButtonBook {
  static List<WidgetbookUseCase> createCases() {
    return [
      WidgetbookUseCase(
        name: 'Ghost Primary Button',
        builder: (context) => Wrap(
          direction: Axis.vertical,
          spacing: 20,
          children: [
            AppButton(
              onPressed: () {},
              size: AppWidgetSize.sm,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
              // iconEnd: Assets.iconCircle,
            ),
            AppButton(
              onPressed: () {},
              size: AppWidgetSize.md,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              size: AppWidgetSize.lg,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              size: AppWidgetSize.xl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
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
        name: 'Ghost Secondary Button',
        builder: (context) => Wrap(
          direction: Axis.vertical,
          spacing: 20,
          children: [
            AppButton(
              onPressed: () {},
              type: AppButtonType.solidSecondary,
              size: AppWidgetSize.sm,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.solidSecondary,
              size: AppWidgetSize.md,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.solidSecondary,
              size: AppWidgetSize.lg,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.solidSecondary,
              size: AppWidgetSize.xl,
              text: ButtonBook.createTextButtonOption(context),
              iconStart:
                  ButtonBook.createIconButtonOption(context, 'Start Icon'),
              iconEnd: ButtonBook.createIconButtonOption(context, 'End Icon'),
              enabled: ButtonBook.createEnabledButtonOption(context),
            ),
            AppButton(
              onPressed: () {},
              type: AppButtonType.solidSecondary,
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
