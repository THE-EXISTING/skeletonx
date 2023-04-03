import 'package:falconx/falconx.dart';
import 'package:flutter/foundation.dart';

/// [Android State]
/// - onCreate
/// - onStart
/// - onResume
/// ----------
/// - onPause
/// - onStop
/// - onDestroy
///
/// [iOS State]
/// - viewDidLoad
/// - viewWillAppear
/// - viewDidAppear
/// ----------
/// - viewWillDisappear
/// - viewDidDisappear
/// - viewDidUnload
///
/// [Flutter State with FalconX]
/// - initState
/// - didChangeDependencies
/// - restoreState
/// - resume (Came to foreground)
/// - build
/// - (didUpdateWidget)
/// ----------
/// - inactive
/// - deactivate
/// - dispose
///
/// - paused (Went to background)
/// - detached
///
/// Read more
/// - https://medium.com/flutter-community/flutter-lifecycle-for-android-and-ios-developers-8f532307e0c7
/// - https://stackoverflow.com/questions/41479255/life-cycle-in-flutter
///
Logger _log = Logger(
  printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false),
);

enum LifecycleState { CREATED, INIT_STATE, RESTORE, RESUME, BUILD }

enum StateEvent { pop }

abstract class StateX<T extends StatefulWidgetX> extends State<T>
    with WidgetsBindingObserver, RestorationMixin, StateXMixin<T> {
  LifecycleState _state = LifecycleState.CREATED;
  bool _isPostedFrame = false;

  @override
  String? get restorationId => widget.key.toString();

  String get tag => '${widget.runtimeType} State';

  bool get isLog => widget.isLog;

  Key? get key => widget.key;

  bool get postedFrame => _isPostedFrame;

  bool _isInitState = true;

  bool get isInitState => _isInitState;

  @override
  void initState() {
    _state = LifecycleState.INIT_STATE;

    if (!kReleaseMode && isLog) {
      _log.v('$tag => Lifecycle State: INIT_STATE');
    }
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      postFrame();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isInitState = false;
  }

  /// Call registerForRestoration(property, 'id'); for register restorable data.
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    _state = LifecycleState.RESTORE;

    if (!kReleaseMode && isLog) {
      _log.v('$tag => Lifecycle State: RESTORE_STATE\n'
          'Old bucket: $oldBucket\n'
          'Initial restore: $initialRestore');
    }

    if (!kReleaseMode && isLog) {
      _log.v('$tag => Lifecycle State: RESUMED');
    }
    resumed();
  }

  @override
  void resumed() {}

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    if (!kReleaseMode && isLog) {
      _log.v('$tag => Lifecycle State: INACTIVE');
    }
    inactive();

    if (!kReleaseMode && isLog) {
      _log.v('$tag => Lifecycle State: DEACTIVATE');
    }
    super.deactivate();
  }

  @override
  void postFrame() {
    _isPostedFrame = true;
  }

  /// Don't forget to call YourRestorable.dispose();
  @override
  void dispose() {
    if (!kReleaseMode && isLog) {
      _log.v('$tag => Lifecycle State: DISPOSE');
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void inactive() {}

  /// Went to Background
  @override
  void paused() {}

  @override
  void detached() {}

  @protected
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (!kReleaseMode && isLog) {
          _log.v('$tag => Lifecycle State: RESUMED');
        }
        _state = LifecycleState.RESTORE;
        resumed();
        setState(() {});
        break;
      case AppLifecycleState.inactive:
        if (!kReleaseMode && isLog) {
          _log.v('$tag => Lifecycle State: INACTIVE');
        }
        inactive();
        break;
      case AppLifecycleState.paused:
        _log.v('$tag => Lifecycle State: PAUSED');
        paused();
        // deactivate();
        break;
      case AppLifecycleState.detached:
        _log.v('$tag => Lifecycle State: DETACHED');
        detached();
        // dispose();
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void registerForRestoration(
      RestorableProperty<Object?> property, String restorationId) {
    super.registerForRestoration(property, restorationId);
  }

  Future<T?> pushScreen(String screenName,
      {Map<String, dynamic>? queryParams}) {
    return queryParams == null
        ? context.pushNamed(screenName)
        : context.pushNamed(screenName, queryParams: queryParams);
  }

  void goToScreen(String screenName, {Map<String, dynamic>? queryParams}) {
    return queryParams == null
        ? context.goNamed(screenName)
        : context.goNamed(screenName, queryParams: queryParams);
  }

  void replaceScreen(String screenName, {Map<String, dynamic>? queryParams}) {
    return queryParams == null
        ? context.replaceNamed(screenName)
        : context.replaceNamed(screenName, queryParams: queryParams);
  }

  void popScreen() {
    return context.pop();
  }
}
