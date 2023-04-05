import 'package:skeletonx/core/core.dart';

class IngredientDetailScreen extends AppScreen {
  const IngredientDetailScreen._({required Key key}) : super(key: key);

  static Widget create({required String name}) {
    return BlocProvider(
      create: (context) => IngredientBloc(name: name)
        ..addInitEvent(IngredientEvent.loadIngredient),
      child: const IngredientDetailScreen._(
        key: Key('IngredientDetailScreen'),
      ),
    );
  }

  @override
  State<IngredientDetailScreen> createState() => _IngredientDetailScreenState();
}

class _IngredientDetailScreenState extends AppScreenLocaleScaffoldBlocState<
    IngredientDetailScreen, IngredientBloc, Resource<IngredientModel?>> {
  final String ingredientName = '';

  @override
  void onListenEvent(BuildContext context, Object event, Object? data) {}

  @override
  PreferredSizeWidget? buildAppBar(Resource<IngredientModel?> state) {
    return AppToolbar(title: 'Ingredient Detail');
  }

  @override
  Widget buildBodyLoading(
      BuildContext context, Resource<IngredientModel?> state) {
    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget buildBody(BuildContext context, Resource<IngredientModel?> state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildNameText(state, context),
          _buildDescriptionText(state),
          _buildIsAlcoholText(state),
        ],
      ),
    );
  }

  Widget _buildNameText(
      Resource<IngredientModel?> state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text('${state.data?.name}',
          style: Theme.of(context).textTheme.headlineSmall),
    );
  }

  Widget _buildDescriptionText(Resource<IngredientModel?> state) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text('${state.data?.description}'),
    );
  }

  Widget _buildIsAlcoholText(Resource<IngredientModel?> state) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(
          state.data?.isAlcohol == true
              ? Icons.dangerous
              : Icons.health_and_safety,
          color: state.data?.isAlcohol == true ? Colors.red : Colors.green,
        ),
        Text(
          state.data?.isAlcohol == true ? 'Is Alcohol' : 'No Alcohol',
          style: TextStyle(
              color: state.data?.isAlcohol == true ? Colors.red : Colors.green),
        ),
      ],
    );
  }
}
