import 'package:skeletonx/core/core.dart';
import 'src/application.dart';
import 'src/features/settings/setting_model.dart';
import 'src/features/settings/settings_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await runApplication();
}

Future<void> runApplication({Widget? testWidget, SettingModel? setting}) async {
  runApp(MyApplication(
    widget: testWidget,
    testSetting: setting,
  ));
}
