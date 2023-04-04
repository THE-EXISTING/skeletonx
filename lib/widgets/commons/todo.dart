import 'package:skeletonx/core/core.dart';

enum TodoFeature { authentication }

class TodoView extends AppComponent {
  const TodoView({
    Key? key,
    required this.todo,
    required this.appbar,
    this.onPress,
  }) : super(key: key);

  static Widget create({
    required TodoFeature todo,
    required bool appbar,
    GestureTapCallback? onPress,
  }) =>
      TodoView(
        todo: todo,
        appbar: appbar,
        onPress: onPress,
      );

  final TodoFeature todo;
  final bool appbar;
  final GestureTapCallback? onPress;

  @override
  Widget buildDefault(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.bglightMode,
      appBar: appbar
          ? AppBar(
              elevation: 0,
              // iconTheme: const IconThemeData(color: AppColors.primary),
              // backgroundColor: AppColors.bgComponentlightMode,
              centerTitle: true,
              title: const Text(
                'รอดำเนินการจัดทำ',
                // style: AppTextStyle.primary.h6.blackActive,
              ),
            )
          : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "เริ่มทำในหัวข้อ",
              // style: AppTextStyle.primary.body1.blackActive,
            ),
            Space.height8,
            Text(
              _getTopic(),
              // style: AppTextStyle.primary.title1.blackActive,
            ),
            Space.height32,
            // AppButton(
            //   title: "กลับ",
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // )
          ],
        ),
      ),
    );
  }

  String _getTopic() {
    switch (todo) {
      case TodoFeature.authentication:
        return 'Authentication';
    }
  }
}
