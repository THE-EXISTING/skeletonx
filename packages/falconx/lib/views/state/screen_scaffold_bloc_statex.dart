import 'package:falconx/falconx.dart';

class _PageLoadingIndicatorNotifier extends ValueNotifier<bool> {
  _PageLoadingIndicatorNotifier() : super(false);
}

abstract class ScreenScaffoldBlocStateX<T extends StatefulWidgetX,
    B extends BlocBase<S>, S> extends StateX<T> {
  B get bloc => context.read<B>();

  ScreenEventCubit? _screenEventCubit;

  final _PageLoadingIndicatorNotifier _showPageLoadingIndicator =
      _PageLoadingIndicatorNotifier();

  @override
  void initState() {
    super.initState();
    if (bloc is BlocX) {
      _screenEventCubit = (bloc as BlocX).screenEventCubit;
    } else {
      Log.w('No use Blocx');
    }
  }

  Color get backgroundColor => Colors.white;

  @protected
  @override
  @Deprecated('Please use [buildDefault] instead')
  Widget build(BuildContext context) {
    return BlocListener<ScreenEventCubit, BlocEvent?>(
      bloc: _screenEventCubit,
      listener: (context, BlocEvent? blocEvent) {
        if (blocEvent?.name == ScreenEvent.pop) {
          Navigator.pop(context, blocEvent?.data);
        } else if (blocEvent != null) {
          onListenEvent(context, blocEvent.name, blocEvent.data);
        }
      },
      child: BlocResourceConsumerX<B, S>(
        listener: onListenBloc,
        exception: onExceptionBloc,
        buildWhen: buildWhen,
        listenWhen: listenWhen,
        builder: (context, state) {
          return GestureDetector(
            onTap: () => clearFocus(),
            child: WillPopScope(
              onWillPop: () => onWillPop(state),
              child: Scaffold(
                backgroundColor: backgroundColor,
                appBar: buildAppBar(state),
                body: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    buildContent(context, state),
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void clearFocus() => FocusManager.instance.primaryFocus?.unfocus();

  Widget buildContent(BuildContext context, S state) {
    Widget buildWidget;
    if (state is Resource) {
      switch (state.status) {
        case Status.init:
          buildWidget = buildBodyEmpty(context, state);
          postBuild(context, state);
          return buildWidget;
        case Status.success:
          buildWidget = buildBody(context, state);
          postBuild(context, state);
          return buildWidget;
        case Status.loading:
          buildWidget = buildBodyLoading(context, state);
          postBuild(context, state);
          return buildWidget;
        case Status.exception:
          buildWidget = buildBodyError(context, state);
          postBuild(context, state);
          return buildWidget;
      }
    }
    buildWidget = buildBody(context, state);
    postBuild(context, state);
    return buildWidget;
  }

  Widget buildBody(BuildContext context, S state);

  Widget buildBodyLoading(BuildContext context, S state) {
    return buildBody(context, state);
  }

  Widget buildBodyEmpty(BuildContext context, S state) {
    return buildBody(context, state);
  }

  Widget buildBodyDisabled(BuildContext context, S state) {
    return buildBody(context, state);
  }

  Widget buildBodyError(BuildContext context, S state) {
    return buildBody(context, state);
  }

  Widget buildPageLoadingIndicator() {
    return Space.boxZero;
  }

  void postBuild(BuildContext context, S state) {}

  void onListenEvent(BuildContext context, Object event, Object? data) {}

  void onExceptionBloc(context, exception) {}

  void onListenBloc(context, state) {}

  PreferredSizeWidget? buildAppBar(S state) {
    return null;
  }

  Future<bool> onWillPop(S state) {
    clearFocus();
    if (state is Resource && state.status == Status.loading) {
      return Future.value(false);
    }
    return Future.value(true);
  }

  bool listenWhen(previous, current) {
    return true;
  }

  bool buildWhen(previous, current) {
    return true;
  }

  void showPageLoadingIndicatorFromResource(Resource resource,
      {bool otherCondition = true}) {
    if (resource.isLoading() && otherCondition) {
      showPageLoadingIndicator();
    } else {
      hidePageLoadingIndicator();
    }
  }

  void showPageLoadingIndicator() {
    _showPageLoadingIndicator.value = true;
  }

  void hidePageLoadingIndicator() {
    _showPageLoadingIndicator.value = false;
  }
}
