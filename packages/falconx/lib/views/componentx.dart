import 'package:falconx/falconx.dart';

abstract class ComponentX extends StatelessWidgetX {
  final ViewState state;

  const ComponentX({
    Key? key,
    ViewState? state,
  })  : state = state ?? ViewState.normal,
        super(key: key);

  bool get isNormal => state == ViewState.normal;
  bool get isNotNormal => !isNormal;

  bool get isLoading => state == ViewState.loading;
  bool get isNotLoading => !isLoading;

  bool get isEmpty => state == ViewState.empty;
  bool get isNotEmpty => !isEmpty;

  bool get isError => state == ViewState.error;
  bool get isNotError => !isError;


  @protected
  @override
  @Deprecated('Please use [buildDefault] instead')
  Widget build(BuildContext context) {
    switch (state) {
      case ViewState.normal:
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
}
