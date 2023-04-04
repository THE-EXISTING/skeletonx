import 'package:flutter/foundation.dart';
import 'package:skeletonx/core/core.dart';

class AppToolbar extends AppComponent with PreferredSizeWidget {
  AppToolbar({
    Key? key,
    required this.title,
    this.height,
    this.isUseBackButton = true,
    this.centerTitle = true,
    this.alignment = TextAlign.center,
    this.themeMode = ThemeMode.dark,
    this.transparent = false,
    this.backButtonWidget,
    List<Widget>? actionWidgets,
  })  : actionWidgets = actionWidgets ?? [],
        super(key: key);

  final double? height;
  final String title;
  final bool isUseBackButton;
  final bool transparent;
  final bool centerTitle;
  final TextAlign alignment;
  final ThemeMode themeMode;
  final List<Widget> actionWidgets;
  final Widget? backButtonWidget;

  @override
  Widget buildDefault(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: kIsWeb ? false : true,
      toolbarHeight: height ?? AppSize.toolbar,
      leadingWidth: 64,
      title: AppText(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      elevation: 0,
      centerTitle: centerTitle,
      actions: actionWidgets,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, height ?? kToolbarHeight);
}
