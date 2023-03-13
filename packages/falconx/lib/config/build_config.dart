part of falconx;


enum BuildMode { debug, release }

class BuildConfig {
  static bool get debug => !kReleaseMode;

  static bool get release => kReleaseMode;

  static BuildMode get mode {
    if (BuildConfig.debug) {
      return BuildMode.debug;
    } else {
      return BuildMode.release;
    }
  }
}
