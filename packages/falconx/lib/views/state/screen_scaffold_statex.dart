import 'package:falconx/falconx.dart';

class _PageLoadingIndicatorNotifier extends ValueNotifier<bool> {
  _PageLoadingIndicatorNotifier() : super(false);
}

abstract class ScreenScaffoldStateX<T extends StatefulWidgetX>
    extends StateX<T> {
  final ViewStateNotifier _screenState =
      ViewStateNotifier(state: ViewState.normal);

  ViewState get state => _screenState.value;

  ViewStateNotifier get screenState => _screenState;

  final _PageLoadingIndicatorNotifier _showPageLoadingIndicator =
      _PageLoadingIndicatorNotifier();

  Color get backGroundColor => Colors.white;

  @protected
  @override
  @Deprecated('Please use [buildDefault] instead')
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => onWillPop(),
        child: Scaffold(
          backgroundColor: backGroundColor,
          appBar: buildAppBar(),
          body: ValueListenableBuilder<ViewState>(
              valueListenable: screenState,
              builder: (context, viewState, child) {
                return Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    buildMainContent(context, viewState),
                    ValueListenableBuilder<bool>(
                      valueListenable: _showPageLoadingIndicator,
                      builder: (context, show, child) {
                        if (show) {
                          return buildPageLoadingIndicator();
                        } else {
                          return Space.boxZero;
                        }
                      },
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  void clearFocus() => FocusManager.instance.primaryFocus?.unfocus();

  Widget buildMainContent(BuildContext context, ViewState viewState) {
    switch (viewState) {
      case ViewState.normal:
        return buildBody(context);
      case ViewState.loading:
        return buildBodyLoading(context);
      case ViewState.empty:
        return buildBodyEmpty(context);
      case ViewState.disabled:
        return buildBodyDisabled(context);
      case ViewState.error:
        return buildBodyError(context);
    }
  }

  Widget buildBody(BuildContext context);

  Widget buildBodyLoading(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBodyEmpty(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBodyDisabled(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBodyError(BuildContext context) {
    return buildBody(context);
  }

  Widget buildPageLoadingIndicator() {
    return Space.boxZero;
  }

  void emitChangeScreenState(ViewState state) {
    _screenState.value = state;
  }

  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  Future<bool> onWillPop() {
    clearFocus();
    return Future.value(true);
  }
}
