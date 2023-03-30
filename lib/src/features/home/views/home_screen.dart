import 'package:skeletonx/core/core.dart';

import '../usecases/home_bloc.dart';

class HomeScreen extends AppScreen {
  const HomeScreen._({required Key key}) : super(key: key);

  static Widget create() => //
      BlocProvider(
        create: (context) => HomeBloc()..addInitEvent(HomeEvent.loadHomePage),
        child: const HomeScreen._(
          key: Key('HomeScreen'),
        ),
      );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends AppScreenLocaleScaffoldBlocState<HomeScreen,
    HomeBloc, Resource<List<HomeDrinkModel?>>> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Future<bool> onWillPop(Resource<List<HomeDrinkModel?>> resource) {
    return Future.value(false);
  }

  @override
  PreferredSizeWidget? buildAppBar(Resource<List<HomeDrinkModel?>> state) {
    return AppToolbar(
      title: 'NEXTZY BAR ',
      backButtonWidget: drawerIcon(),
      actionWidgets: [dropdownMenu()],
    );
  }

  @override
  Widget buildBodyLoading(
      BuildContext context, Resource<List<HomeDrinkModel?>> state) {
    if (state.isLoading()) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return buildBody(context, state);
    }
  }

  @override
  Widget buildBody(BuildContext context, Resource<List<HomeDrinkModel?>> state) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(context),
      body: ListView(
        children: <Widget>[
          header('Popular Drinks'),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              for (HomeDrinkModel? drink in state.data ?? []) ...{
                itemContainer(drink)
              }
            ],
          ),
        ],
      ),
    );
  }

  Widget header(String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.deepOrange,
      ),
      child: AppText(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget itemContainer(HomeDrinkModel? drink) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.amber[400],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(drink?.thumbnailUrl ?? ''),
              ),
            ),
          ),
          Center(
            child: AppText(drink?.name, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
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

  Widget drawerIcon() {
    return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          if (_scaffoldKey.currentState?.isDrawerOpen == false) {
            _scaffoldKey.currentState?.openDrawer();
          } else {
            _scaffoldKey.currentState?.closeDrawer();
          }
        });
  }

  Widget drawer(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child:
            //TODO: Handle Drawer Menu Detail onClick
            Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                  height: 64,
                  width: double.infinity,
                  child: DrawerHeader(
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Details')))),
              ListTile(
                title: const Text('Refresh'),
                onTap: () {
                  // mock up as refresh button
                  bloc.addClickEvent(HomeEvent.loadHomePage);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }

  Widget dropdownMenu() {
    //TODO: Handle DropDown Menu onClick
    return PopupMenuButton(itemBuilder: (context) {
      return [
        const PopupMenuItem<int>(
          value: 0,
          child: Text("Login"),
        ),
        const PopupMenuItem<int>(
          value: 1,
          child: Text("Settings"),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text("About"),
        ),
      ];
    }, onSelected: (value) {
      if (value == 0) {
      } else if (value == 1) {
      } else if (value == 2) {}
    });
  }
}