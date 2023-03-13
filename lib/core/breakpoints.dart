import 'package:falconx/falconx.dart';

enum Breakpoint {
  mobile,
  mobileLand,
  tablet,
  desktop,
  desktopLg,
  desktop4k,
}

class AppBreakpoint {
  static const double mobileMax = 480;
  static const double mobileLandMax = 768;
  static const double tabletMax = 992;
  static const double desktopMax = 1280;
  static const double desktopLgMax = 1920;

  static const double contentMin = 240;
  static const double contentMax = 1200;

  static Breakpoint checkBreakPoint(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= mobileMax) {
      return Breakpoint.mobile;
    } else if (screenWidth > mobileMax && screenWidth <= mobileLandMax) {
      return Breakpoint.mobileLand;
    } else if (screenWidth > mobileLandMax && screenWidth <= tabletMax) {
      return Breakpoint.tablet;
    } else if (screenWidth > tabletMax && screenWidth <= desktopMax) {
      return Breakpoint.desktop;
    } else if (screenWidth > desktopMax && screenWidth <= desktopLgMax) {
      return Breakpoint.desktopLg;
    } else {
      return Breakpoint.desktop4k;
    }
  }
}
