import 'package:falconx/falconx.dart';

enum ViewState {
  normal,
  disabled,
  loading,
  empty,
  error,
}

class ViewStateNotifier extends ValueNotifier<ViewState> {
  ViewStateNotifier({
    required ViewState state,
  }) : super(state);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}