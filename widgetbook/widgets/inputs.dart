import 'package:skeletonx/core/core.dart';
import 'package:widgetbook/widgetbook.dart';

class ButtonBook {
  static WidgetbookComponent createSolidButton() {
    return WidgetbookComponent(
      name: 'Button',
      useCases: [
        WidgetbookUseCase(
          name: 'Solid Button',
          builder: (context) => Wrap(
            direction: Axis.vertical,
            spacing: 20,
            children: [
              AppButton(
                onPressed: () {},
                size: AppWidgetSize.sm,
                text: _createTextButtonOption(context),
                iconStart: _createIconButtonOption(context, 'Start Icon'),
                iconEnd: _createIconButtonOption(context, 'End Icon'),
                // iconEnd: Assets.iconCircle,
              ),
              AppButton(
                onPressed: () {},
                size: AppWidgetSize.md,
                text: _createTextButtonOption(context),
                iconStart: _createIconButtonOption(context, 'Start Icon'),
                iconEnd: _createIconButtonOption(context, 'End Icon'),
              ),
              AppButton(
                onPressed: () {},
                size: AppWidgetSize.lg,
                text: _createTextButtonOption(context),
                iconStart: _createIconButtonOption(context, 'Start Icon'),
                iconEnd: _createIconButtonOption(context, 'End Icon'),
              ),
              AppButton(
                onPressed: () {},
                size: AppWidgetSize.xl,
                text: _createTextButtonOption(context),
                iconStart: _createIconButtonOption(context, 'Start Icon'),
                iconEnd: _createIconButtonOption(context, 'End Icon'),
              ),
              AppButton(
                onPressed: () {},
                size: AppWidgetSize.xxl,
                text: _createTextButtonOption(context),
                iconStart: _createIconButtonOption(context, 'Start Icon'),
                iconEnd: _createIconButtonOption(context, 'End Icon'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///========================= OPTIONS =========================///
  static String? _createIconButtonOption(BuildContext context, String label) =>
      context.knobs.options(label: label, options: [
        Assets.iconCircle,
        null,
      ]);

  static String? _createTextButtonOption(BuildContext context) =>
      context.knobs.text(label: 'Text', initialValue: 'Button Text');
}
