import 'package:falconx/falconx.dart';

abstract class BaseBloc<State> extends Bloc<Object, State> {
  BaseBloc(State initialState)
      : _fetcher = FetcherList(),
        super(initialState);

  final FetcherList _fetcher;
  final screenEventCubit = ScreenEventCubit();
  final StreamController<State> _controller =
      StreamController<State>.broadcast();

  @override
  Stream<State> get stream => _controller.stream;

  void fetch<T extends Resource>({
    required Object key,
    required Stream<T> call,
    required Function(T resource) onResource,
    Function? onLoading,
  }) =>
      _fetcher.fetch(
          key: key, call: call, onResource: onResource);

  @override
  Future<void> close() {
    _fetcher.close();
    screenEventCubit.close();
    return super.close();
  }

  void emitState(State newValue) => _controller.add(newValue);

  void emitResourceSuccessState<T>(T newValue) =>
      _controller.add(Resource.success(data: newValue) as State);

  void emitPopScreen<T>([T? result]) {
    screenEventCubit.emitPopScreen(result);
  }

  void emitEvent<T>(T event, {Object? data}) {
    screenEventCubit.emit(BlocEvent<T>(name: event, data: data));
  }
}
