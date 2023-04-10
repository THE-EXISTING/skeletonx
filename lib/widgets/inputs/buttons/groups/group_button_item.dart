import 'package:skeletonx/core/core.dart';

class AppGroupButtonItem {
  AppGroupButtonItem({
    required this.id,
    this.iconStart,
    this.title,
    this.iconEnd,
    this.onlyIcon,
  });

  String id;
  String? iconStart;
  String? title;
  String? iconEnd;
  bool? onlyIcon; // Use iconStart
}

class AppGroupButton<T> extends AppComponentGroup {
  AppGroupButton({
    Key? key,
    this.size = AppWidgetSize.md,
    required this.buttons,
    this.isRadio = true,
    GroupButtonController? controller,
    this.maxSelected,
    this.onSelected,
    this.strokeThickness,
    this.strokeColor,
    this.cornerRadius,
    this.enabled = true,
    this.enableDeselect = false,
    int? selectedIndex,
    List<int> selectedIndexes = const [],
  }) : super(key: key) {
    this.controller = controller ??
        GroupButtonController(
          selectedIndex: selectedIndex,
          selectedIndexes: selectedIndexes,
        );
  }

  final AppWidgetSize size;
  final List<AppGroupButtonItem> buttons;
  late final GroupButtonController? controller;
  final bool isRadio;
  final int? maxSelected;
  final double? strokeThickness;
  final Color? strokeColor;
  final double? cornerRadius;
  final bool enabled;
  final bool enableDeselect;
  final Function(T id, int index, bool isSelected)? onSelected;

  @override
  State<AppGroupButton> createState() => _AppGroupButtonState();
}

class _AppGroupButtonState
    extends AppComponentGroupLocaleState<AppGroupButton> {
  @override
  Widget buildDefault(BuildContext context) {
    final idList = widget.buttons.map((e) => e.id).toList();
    if (widget.enabled == false) {
      widget.controller
          ?.disableIndexes(List.generate(idList.length, (index) => index));
    }
    return ContainerLayout(
      direction: Axis.horizontal,
      strokeThickness: widget.strokeThickness ?? theme.lineStrokeThickness,
      strokeColor: widget.strokeColor ?? theme.lineStrokeColor,
      cornerRadius: widget.cornerRadius ?? theme.cornerRadius,
      child: GroupButton(
        enableDeselect: widget.enableDeselect,
        isRadio: widget.isRadio,
        controller: widget.controller,
        maxSelected: widget.maxSelected,
        options: const GroupButtonOptions(
          direction: Axis.horizontal,
          spacing: 0,
          runSpacing: 0,
          mainGroupAlignment: MainGroupAlignment.start,
          crossGroupAlignment: CrossGroupAlignment.start,
        ),
        buttons: idList,
        buttonIndexedBuilder: (selected, index, context) {
          final buttonItem = widget.buttons[index];
          // widget.onSelected?.call(buttonItem.id, index, selected);
          if (buttonItem.onlyIcon == true) {
            //TODO: Add icon button
          }
          return AppBaseButtonGroup(
            size: widget.size,
            text: buttonItem.title ?? '',
            iconStart: buttonItem.iconStart,
            iconEnd: buttonItem.iconEnd,
            enabled: widget.enabled,
            selected: selected,
            onPressed: () {
              widget.controller?.selectedIndexes;
              widget.controller?.selectIndex(index);
              if (widget.enableDeselect == false && selected) {
                widget.onSelected?.call(buttonItem.id, index, selected);
              } else if (widget.enableDeselect == true) {
                if (!selected) {
                  widget.controller?.selectIndex(index);
                } else if (widget.enableDeselect) {
                  widget.controller?.unselectIndex(index);
                }
                widget.onSelected?.call(buttonItem.id, index, !selected);
              } else {
                widget.onSelected?.call(buttonItem.id, index, !selected);
              }
            },
          );
        },
      ),
    );
  }
}
