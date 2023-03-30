import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/src/features/home/home.dart';

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

  bool popular = false;
  bool alcoholic = false;
  bool nonAlcoholic = false;
  List<Widget> data = [];

  @override
  void onListenEvent(BuildContext context, Object event, Object? data) {
    switch (event) {
      case HomeEvent.loadHomePage:
        setState(() {
          popular = true;
        });
        break;

      case HomeEvent.getAlcoholic:
        setState(() {
          alcoholic = true;
        });
        break;

      case HomeEvent.getNonAlcoholic:
        setState(() {
          nonAlcoholic = true;
        });
        break;
    }
  }

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
  Widget buildBody(
      BuildContext context, Resource<List<HomeDrinkModel?>> state) {
    if (popular) {
      data.insert(0, header('Popular Drinks'));
      data.insert(1,
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
          ));
      popular = false;
    }

    if (alcoholic) {
      alcoholic = false;
      data.add(header('Alcoholic'));
      data.add(
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (HomeDrinkModel? drink in state.data ?? []) ...{
                itemHorizontalContainer(drink)
              }
            ],
          ),
        ),
      );
    }

    if (nonAlcoholic) {
      nonAlcoholic = false;
      data.add(header('Non - Alcoholic'));
      data.add(
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (HomeDrinkModel? drink in state.data ?? []) ...{
                itemHorizontalContainer(drink)
              }
            ],
          ),
        ),
      );
    }
    return buildScreen(context, data);
  }

  Widget buildScreen(BuildContext context, List<Widget> data) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: data,
        ),
      ),
    );
  }

  Widget header(String text) {
    return Container(
      width: double.infinity,
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
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.amber[400],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              width: 90,
              height: 90,
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

  Widget itemHorizontalContainer(HomeDrinkModel? drink) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[400],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(drink?.thumbnailUrl ?? ''),
              ),
            ),
          ),
          Center(
            child: AppText(drink?.name, textAlign: TextAlign.justify),
          ),
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
                  popular = false;
                  alcoholic = false;
                  nonAlcoholic = false;
                  data.clear();
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
