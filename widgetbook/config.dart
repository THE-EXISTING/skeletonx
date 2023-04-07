import 'package:falconx/falconx.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetBookConfig {
  ///========================= THEME =========================///
  static final themes = [
    WidgetbookTheme(
      name: 'Light',
      data: ThemeData.light(),
    ),
    WidgetbookTheme(
      name: 'Dark',
      data: ThemeData.dark(),
    )
  ];

  ///========================= DEVICES =========================///
  static const devices = [
    Device.mobile(
      name: 'Android',
      resolution: Resolution(
        nativeSize: DeviceSize(width: 360, height: 720),
        scaleFactor: 1,
      ),
    ),
    Device.special(
      name: 'Square',
      resolution: Resolution(
        nativeSize: DeviceSize(width: 500, height: 500),
        scaleFactor: 1,
      ),
    ),
    Apple.iPhone13,
    Apple.iPhone13Pro,
    Apple.iPhone13ProMax,
    Apple.iPadPro10Inch,
    Apple.iPadPro12inch,
    Desktop.desktop1080p,
    Desktop.desktop1440p,
    Desktop.desktop4k,
  ];

  ///========================= Frame =========================///
  static final frames = [
    WidgetbookFrame(
      setting: DeviceSetting.firstAsSelected(devices: devices),
    ),
    NoFrame(),
    DefaultDeviceFrame(
      setting: DeviceSetting.firstAsSelected(devices: devices),
    )
  ];
}
