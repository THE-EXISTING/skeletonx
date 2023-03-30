import 'package:falconx/falconx.dart';

extension SentryExtension on Exception {
  Future<SentryId> sentryCaptureException(
    dynamic stackTrace, {
    Hint? hint,
    ScopeCallback? withScope,
  }) =>
      Sentry.captureException(
        this,
        stackTrace: stackTrace,
        hint: hint,
        withScope: withScope,
      );
}
