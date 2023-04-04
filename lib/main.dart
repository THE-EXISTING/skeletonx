import 'package:skeletonx/core/core.dart';
import 'src/features/settings/setting_model.dart';
import 'src/features/settings/settings_controller.dart';

void main() async {
  setPathUrlStrategy(); //remove "#" sign on web's browser

  WidgetsFlutterBinding.ensureInitialized();
  await SettingsController.instance.loadSettings();
  await runApplication();
}

Future<void> runApplication({Widget? testWidget, SettingModel? setting}) async {
  Catcher(
    ensureInitialized: true,
    debugConfig: setupCatcherDebugOptions(),
    releaseConfig: setupCatcherReleaseOptions(),
    runAppFunction: () {
      runApp(MyApplication(
        widget: testWidget,
        testSetting: setting,
      ));
    },
  );

  // Catcher(
  //   ensureInitialized: true,
  //   debugConfig: setupCatcherDebugOptions(),
  //   releaseConfig: setupCatcherReleaseOptions(),
  //   runAppFunction: () {
  //     runApp(MultiBlocProvider(
  //       providers: [],
  //       child: MyApplication(
  //         widget: testWidget,
  //         testSetting: setting,
  //       ),
  //     ));
  //   },
  // );
}
