import 'package:skeletonx/core/core.dart';

class DrinkDetailScreen extends AppScreen {
  const DrinkDetailScreen._({required Key key}) : super(key: key);

  static Widget create({required String id}) => //
      BlocProvider(
        create: (context) =>
            CocktailBloc(id: id)..addInitEvent(CocktailEvent.loadDrink),
        child: const DrinkDetailScreen._(
          key: Key('DrinkDetailScreen'),
        ),
      );

  @override
  State<DrinkDetailScreen> createState() => _DrinkDetailScreenState();
}

class _DrinkDetailScreenState extends AppScreenLocaleScaffoldBlocState<
    DrinkDetailScreen, CocktailBloc, Resource<DrinkModel?>> {
  @override
  Future<bool> onWillPop(Resource<DrinkModel?> resource) {
    return Future.value(false);
  }

  @override
  PreferredSizeWidget? buildAppBar(Resource<DrinkModel?> state) {
    return AppToolbar(title: 'Detail');
  }

  @override
  Widget buildBodyLoading(BuildContext context, Resource<DrinkModel?> state) {
    return buildBody(context, state);
  }

  @override
  Widget buildBody(BuildContext context, Resource<DrinkModel?> state) {
    return Column(
      children: [
        Expanded(
          child: AppScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                _buildTitleText(state.data),
                const SizedBox(height: 20),
                _buildImage(state.data),
                const SizedBox(height: 20),
                _buildInstructionsText(state.data),
                const SizedBox(height: 20),
                _buildIngredientTitleText(),
                _buildIngredientTabs(state.data),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleText(DrinkModel? model) {
    if (model == null) return Space.empty;
    return Text(
      model.name,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildImage(DrinkModel? model) {
    if (model == null) return Space.empty;
    return SizedBox(
      width: 200,
      height: 200,
      child: Image.network(model.thumbnailUrl),
    );
  }

  Widget _buildInstructionsText(DrinkModel? model) {
    if (model == null) return Space.empty;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            '- Instructions -',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Text(model.instruction),
        ],
      ),
    );
  }

  Widget _buildIngredientTitleText() {
    return Container(
      padding: const EdgeInsets.only(left: 25),
      width: double.infinity,
      child: Text(
        'Ingredient',
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildIngredientTabs(DrinkModel? model) {
    return Wrap(
      children: [
        _buildIngredientTab(model),
        _buildIngredientTab(model),
        _buildIngredientTab(model),
      ],
    );
  }

  Widget _buildIngredientTab(DrinkModel? model) {
    if (model == null) return Space.empty;
    return Container(
      margin: const EdgeInsets.all(12.0),
      color: Colors.grey[300],
      width: 150,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.access_alarm),
          Text(model.props.second.toString()),
        ],
      ),
    );
  }
}