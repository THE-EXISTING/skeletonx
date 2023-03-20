import 'package:skeletonx/core/core.dart';

class AppBlocConsumer<B extends BlocBase<S>, S>
    extends BlocResourceConsumerX<B, S> {
  const AppBlocConsumer({
    Key? key,
    BlocWidgetListener<S>? listener,
    BlocWidgetException? exception,
    required BlocWidgetBuilder<S> builder,
    B? bloc,
    BlocBuilderCondition<S>? buildWhen,
    BlocListenerCondition<S>? listenWhen,
  }) : super(
            key: key,
            listener: listener,
            exception: exception,
            builder: builder,
            bloc: bloc,
            buildWhen: buildWhen,
            listenWhen: listenWhen);

  @override
  State<BlocResourceConsumerX<B, S>> createState() =>
      _AppBlocConsumerState<B, S>();
}

class _AppBlocConsumerState<B extends BlocBase<S>, S>
    extends BlocConsumerStateX<B, S> {

  @override
  void handlerException(BuildContext context, Object exception) {
    //TODO: Handle global exception here.
  }

}
