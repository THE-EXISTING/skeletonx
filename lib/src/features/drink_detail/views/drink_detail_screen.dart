import 'package:skeletonx/core/core.dart';

class DrinkDetailScreen extends AppScreen {
  const DrinkDetailScreen._({required Key key}) : super(key: key);

  static Widget create({required String id}) => //
  BlocProvider(
    create: (context) =>
    CocktailBloc(id: id)
      ..addInitEvent(CocktailEvent.loadDrink),
    child: const DrinkDetailScreen._(
      key: Key('DrinkDetailScreen'),
    ),
  );

  @override
  State<DrinkDetailScreen> createState() => _DrinkDetailScreenState();
}

class _DrinkDetailScreenState extends AppScreenLocaleScaffoldBlocState<
    DrinkDetailScreen,
    CocktailBloc,
    Resource<DrinkModel?>> {
  @override
  Future<bool> onWillPop(Resource<DrinkModel?> resource) {
    return Future.value(false);
  }

  @override
  PreferredSizeWidget? buildAppBar(Resource<DrinkModel?> state) {
    return AppToolbar(title: 'Detail', backButtonWidget: _backButton(),);
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
              children: [
                const SizedBox(height: 20),
                _buildTitleText(state.data),
                const SizedBox(height: 20),
                _buildImage(state.data),
                const SizedBox(height: 20),
                _buildInstructionsText(state.data),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _backButton() {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },);
  }

  Widget _buildTitleText(DrinkModel? model) {
    if (model == null) return Space.empty;
    return Text(
      model.name,
      style: Theme.of(context).textTheme.titleLarge,
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
}
