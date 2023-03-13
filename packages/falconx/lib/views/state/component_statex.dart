import 'package:falconx/falconx.dart';

abstract class ComponentStateX<T extends StatefulWidgetX> extends StateX<T> {
  ComponentStateX({ViewState? viewState})
      : _stateNotifier =
            ViewStateNotifier(state: viewState ?? ViewState.normal);

  final ViewStateNotifier _stateNotifier;

  ViewState get viewState => _stateNotifier.value;

  @protected
  @override
  @Deprecated('Please use [buildDefault] instead')
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewStateNotifier>(
        create: (context) => _stateNotifier,
        child: Consumer<ViewStateNotifier>(//
            builder: (context, viewState, child) {
          switch (viewState.value) {
            case ViewState.normal:
              if(viewState.value == ViewState.loading) return buildLoading(context);
              if(viewState.value == ViewState.empty) return buildEmpty(context);
              if(viewState.value == ViewState.disabled) return buildDisabled(context);
              if(viewState.value == ViewState.error) return buildError(context);
              return buildDefault(context);
            case ViewState.loading:
              return buildLoading(context);
            case ViewState.empty:
              return buildEmpty(context);
            case ViewState.disabled:
              return buildDisabled(context);
            case ViewState.error:
              return buildError(context);
          }
        }));
  }

  Widget buildDefault(BuildContext context);

  Widget buildLoading(BuildContext context) {
    return buildDefault(context);
  }

  Widget buildEmpty(BuildContext context) {
    return buildDefault(context);
  }

  Widget buildDisabled(BuildContext context) {
    return buildDefault(context);
  }

  Widget buildError(BuildContext context) {
    return buildDefault(context);
  }

  void changeState(ViewState state) {
    _stateNotifier.value = state;
  }
}
