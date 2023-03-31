import 'package:skeletonx/core/core.dart';

class CocktailHomeScreen extends AppScreen {
  const CocktailHomeScreen._({required Key key}) : super(key: key);

  static Widget create({required String id, required String name}) => //
      BlocProvider(
        create: (context) => CocktailBloc(id: id, name: name)
          ..addInitEvent(CocktailEvent.loadSearchByName),
        child: const CocktailHomeScreen._(
          key: Key('CocktailHomeScreen'),
        ),
      );

  @override
  State<CocktailHomeScreen> createState() => _DrinkDetailScreenState();
}

class _DrinkDetailScreenState extends AppScreenLocaleScaffoldBlocState<
    CocktailHomeScreen, CocktailBloc, Resource<List<DrinkModel>>> {
  @override
  void onListenEvent(BuildContext context, Object event, Object? data) {}

  // @override
  // PreferredSizeWidget? buildAppBar(Resource<List<DrinkModel>> state) {
  //   return AppToolbar(title: 'Detail');
  // }

  @override
  Widget buildBodyLoading(
      BuildContext context, Resource<List<DrinkModel>> state) {
    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget buildBody(BuildContext context, Resource<List<DrinkModel>> state) {
    return Scaffold(
      appBar: AppToolbar(
        title: 'Cocktail DB',
        actionWidgets: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: 'hahahaha');
                },
                child: const Icon(Icons.more_vert),
              )),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(state.data?.length ?? 0, (index) {
          return Card(
              color: Colors.deepOrangeAccent,
              child: InkWell(
                onTap: () {
                  pushScreen(CocktailDetailScreen.create(id: state.data?[index].id ?? ''));
                },
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(child: _buildImage(state.data?[index])),
                        const SizedBox(height: 20),
                        _buildTitleText(state.data?[index])
                      ]),
                ),
              ));
        }),
      ),
    );
  }

  Widget _buildTitleText(DrinkModel? model) {
    if (model == null) return Space.empty;
    return Container(
      //apply margin and padding using Container Widget.
      margin: const EdgeInsets.only(bottom: 16),
      child: Text(model.name, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget _buildImage(DrinkModel? model) {
    if (model == null) return Space.empty;
    return Container(
      margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
      child: SizedBox(
          width: 200, height: 200, child: Image.network(model.thumbnailUrl)),
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
