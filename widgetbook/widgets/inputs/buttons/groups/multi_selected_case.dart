import '../../../../widgetbook.dart';

class ButtonGroupMultiSelectedCases {
  static List<WidgetbookUseCase> createCases() {
    const isRadio = false;
    const selectedIndex = 1;
    const enabledDeselect = true;
    const maxSelected = 2;

    return [
      WidgetbookUseCase(
        name: 'Multi Selected',
        builder: (context) => ContainerLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          padding: PaddingSpace.all16,
          children: [
            AppGroupButton(
              isRadio: isRadio,
              selectedIndex: selectedIndex,
              enableDeselect: enabledDeselect,
              maxSelected: maxSelected,
              size: AppWidgetSize.sm,
              buttons: [
                AppGroupButtonItem(
                  id: '1',
                  title: ButtonBook.createTextButtonOption(context),
                  iconStart:
                      ButtonBook.createIconButtonOption(context, 'Start Icon'),
                  iconEnd:
                      ButtonBook.createIconButtonOption(context, 'End Icon'),
                ),
                AppGroupButtonItem(
                  id: '2',
                  title: ButtonBook.createTextButtonOption(context),
                  iconStart:
                      ButtonBook.createIconButtonOption(context, 'Start Icon'),
                  iconEnd:
                      ButtonBook.createIconButtonOption(context, 'End Icon'),
                ),
                AppGroupButtonItem(
                  id: '3',
                  title: ButtonBook.createTextButtonOption(context),
                  iconStart:
                      ButtonBook.createIconButtonOption(context, 'Start Icon'),
                  iconEnd:
                      ButtonBook.createIconButtonOption(context, 'End Icon'),
                ),
              ],
              enabled: ButtonBook.createEnabledButtonOption(context),
              onSelected: (value, index, isSelected) {
                Log.i('Value: $value, Index: $index, Selected: $isSelected');
              },
            ),
            AppGroupButton(
              isRadio: isRadio,
              selectedIndex: selectedIndex,
              enableDeselect: enabledDeselect,
              maxSelected: maxSelected,
              size: AppWidgetSize.md,
              buttons: [
                AppGroupButtonItem(
                  id: '1',
                  title: ButtonBook.createTextButtonOption(context),
                  iconStart:
                      ButtonBook.createIconButtonOption(context, 'Start Icon'),
                  iconEnd:
                      ButtonBook.createIconButtonOption(context, 'End Icon'),
                ),
                AppGroupButtonItem(
                  id: '2',
                  title: ButtonBook.createTextButtonOption(context),
                  iconStart:
                      ButtonBook.createIconButtonOption(context, 'Start Icon'),
                  iconEnd:
                      ButtonBook.createIconButtonOption(context, 'End Icon'),
                ),
                AppGroupButtonItem(
                  id: '3',
                  title: ButtonBook.createTextButtonOption(context),
                  iconStart:
                      ButtonBook.createIconButtonOption(context, 'Start Icon'),
                  iconEnd:
                      ButtonBook.createIconButtonOption(context, 'End Icon'),
                ),
              ],
              enabled: ButtonBook.createEnabledButtonOption(context),
              onSelected: (value, index, isSelected) {
                Log.i('Value: $value, Index: $index, Selected: $isSelected');
              },
            ),
            AppGroupButton(
              isRadio: isRadio,
              selectedIndex: selectedIndex,
              enableDeselect: enabledDeselect,
              maxSelected: maxSelected,
              size: AppWidgetSize.lg,
              buttons: [
                AppGroupButtonItem(
                  id: '1',
                  title: ButtonBook.createTextButtonOption(context),
                  iconStart:
                      ButtonBook.createIconButtonOption(context, 'Start Icon'),
                  iconEnd:
                      ButtonBook.createIconButtonOption(context, 'End Icon'),
                ),
                AppGroupButtonItem(
                  id: '2',
                  title: ButtonBook.createTextButtonOption(context),
                  iconStart:
                      ButtonBook.createIconButtonOption(context, 'Start Icon'),
                  iconEnd:
                      ButtonBook.createIconButtonOption(context, 'End Icon'),
                ),
                AppGroupButtonItem(
                  id: '3',
                  title: ButtonBook.createTextButtonOption(context),
                  iconStart:
                      ButtonBook.createIconButtonOption(context, 'Start Icon'),
                  iconEnd:
                      ButtonBook.createIconButtonOption(context, 'End Icon'),
                ),
              ],
              enabled: ButtonBook.createEnabledButtonOption(context),
              onSelected: (value, index, isSelected) {
                Log.i('Value: $value, Index: $index, Selected: $isSelected');
              },
            ),
            AppGroupButton(
              isRadio: isRadio,
              selectedIndex: selectedIndex,
              enableDeselect: enabledDeselect,
              maxSelected: maxSelected,
              size: AppWidgetSize.xl,
              buttons: [
                AppGroupButtonItem(
                  id: '1',
                  title: ButtonBook.createTextButtonOption(context),
                  iconStart:
                      ButtonBook.createIconButtonOption(context, 'Start Icon'),
                  iconEnd:
                      ButtonBook.createIconButtonOption(context, 'End Icon'),
                ),
                AppGroupButtonItem(
                  id: '2',
                  title: ButtonBook.createTextButtonOption(context),
                  iconStart:
                      ButtonBook.createIconButtonOption(context, 'Start Icon'),
                  iconEnd:
                      ButtonBook.createIconButtonOption(context, 'End Icon'),
                ),
                AppGroupButtonItem(
                  id: '3',
                  title: ButtonBook.createTextButtonOption(context),
                  iconStart:
                      ButtonBook.createIconButtonOption(context, 'Start Icon'),
                  iconEnd:
                      ButtonBook.createIconButtonOption(context, 'End Icon'),
                ),
              ],
              enabled: ButtonBook.createEnabledButtonOption(context),
              onSelected: (value, index, isSelected) {
                Log.i('Value: $value, Index: $index, Selected: $isSelected');
              },
            ),
          ],
        ),
      ),
    ];
  }
}
