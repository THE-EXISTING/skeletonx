import 'package:skeletonx/core/core.dart';

CatcherOptions setupCatcherDebugOptions() {
  return CatcherOptions(
    PageReportMode(),
    [
      // CrashlyticsHandler(),
      SentryHandler(
        SentryClient(
          SentryOptions(
              dsn:
                  'https://9db44f3e2d704e46a7faf94252b6e68a@o952172.ingest.sentry.io/4504928407650304'),
        ),
      ),
      ConsoleHandler(
          enableApplicationParameters: true,
          enableDeviceParameters: true,
          enableStackTrace: true,
          handleWhenRejected: false)
    ],
    filterFunction: (Report report) {
      //Filter errors which shouldn't be handled and return `false`
      final error = report.error;
      if (error is String &&
          error.contains(
              'therefore the initial route specified will be ignored and')) {
        return false;
      }
      if (error.contains('HttpException: Invalid statusCode: 403, uri =')) {
        return false;
      }

      return true;
    },
  );
}

///  How to manual throw exception to sentry
///  try {
///     aMethodThatMightFail();
///   } catch (exception, stackTrace) {
///     await exception.sentryCaptureException(stackTrace);
///   }
CatcherOptions setupCatcherReleaseOptions() {
  return CatcherOptions(
    SilentReportMode(),
    [
      SentryHandler(
        SentryClient(
          SentryOptions(
              dsn:
                  'https://9db44f3e2d704e46a7faf94252b6e68a@o952172.ingest.sentry.io/4504928407650304'),
        ),
      ),
    ],
    // [CrashlyticsHandler(printLogs: false)],
  );
}
