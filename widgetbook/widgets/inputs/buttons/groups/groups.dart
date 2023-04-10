export 'radio_case.dart';
export 'multi_selected_case.dart';
import '../../../../widgetbook.dart';

class ButtonGroupBook {
  static WidgetbookComponent createBook() {
    return WidgetbookComponent(name: 'Button Group', useCases: [
      ...ButtonGroupRadioCases.createCases(),
      ...ButtonGroupMultiSelectedCases.createCases(),
    ]);
  }
}
