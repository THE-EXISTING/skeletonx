import 'package:skeletonx/core/core.dart';

class YourBlocScreen extends AppScreen {
  const YourBlocScreen._({required Key key}) : super(key: key);

  static Widget create() => //
      BlocProvider(
        create: (context) => YourEventBloc()..addInitEvent(YourEvent.yourEvent),
        child: const YourBlocScreen._(
          key: Key('YourBlocScreen'),
        ),
      );

  @override
  _YourBlocScreenState createState() => _YourBlocScreenState();
}

class _YourBlocScreenState extends AppScreenLocaleScaffoldBlocState<
    YourBlocScreen, YourEventBloc, Resource<YourModel?>> {
  @override
  Future<bool> onWillPop(Resource<YourModel?> resource) {
    return Future.value(false);
  }

  @override
  Widget buildBody(BuildContext context, Resource<YourModel?> state) {
    // TODO: implement buildBody
    throw UnimplementedError();
  }
}
