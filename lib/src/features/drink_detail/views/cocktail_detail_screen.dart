import 'package:skeletonx/core/core.dart';

class CocktailDetailScreen extends AppScreen {
  const CocktailDetailScreen._({required Key key}) : super(key: key);
  static Widget create({required String id}) => //
  BlocProvider(
    create: (context) => CocktailDetailBloc(id: id)
      ..addInitEvent(CocktailDetailEvent.loadDrink),
    child: const CocktailDetailScreen._(
      key: Key('CocktailDetailScreen'),
    ),
  );

  @override
  State<CocktailDetailScreen> createState() => _CocktailDetailScreenState();
}

class _CocktailDetailScreenState extends AppScreenLocaleScaffoldBlocState<
    CocktailDetailScreen, CocktailDetailBloc, Resource<DrinkModel>> {

  @override
  PreferredSizeWidget? buildAppBar(Resource<DrinkModel?> state) {
    return AppToolbar(title: 'Detail');
  }

  @override
  Widget buildBody(BuildContext context, Resource<DrinkModel> state) {
    return Center(
        child: ElevatedButton(
          onPressed: () {
            // popScreen(context);
          },
          child: const Text('Go back!'),
        ),
      );
  }
}