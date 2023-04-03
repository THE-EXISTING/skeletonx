import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/core/routes/routes.dart';

class DrinksHomeScreen extends AppScreen {
  const DrinksHomeScreen._({required Key key}) : super(key: key);

  static Widget create() => BlocProvider(
        create: (context) =>
            CocktailsBloc()..addInitEvent(CocktailsEvent.loadDrinks),
        child: const DrinksHomeScreen._(
          key: Key('DrinksHomeScreen'),
        ),
      );

  @override
  State<DrinksHomeScreen> createState() => _DrinksHomeScreenState();
}

class _DrinksHomeScreenState extends AppScreenLocaleScaffoldBlocState<
    DrinksHomeScreen, CocktailsBloc, Resource<List<DrinkModel>?>> {
  @override
  void onListenEvent(BuildContext context, Object event, Object? data) {}

  @override
  PreferredSizeWidget? buildAppBar(Resource<List<DrinkModel>?> state) {
    return AppToolbar(
      title: 'Drinks',
      actionWidgets: [
        true
            ? _buildLoggedOutPopupMenuButton()
            : _buildLoggedInPopupMenuButton()
      ],
    );
  }

  @override
  Widget? buildDrawer(BuildContext context, Resource<List<DrinkModel>?> state) {
    return Container(
      color: Colors.blue,
      width: 150,
      child: Column(
        children: [
          _buildDrawerMenuItem(
            onTap: () => Log.d('Drinks'),
            icon: const Icon(Icons.emoji_food_beverage, color: Colors.black),
            title: 'Drinks',
          ),
          _buildDrawerMenuItem(
            onTap: () => Log.d('Cars'),
            icon: const Icon(Icons.car_crash_sharp, color: Colors.black),
            title: 'Cars',
          ),
          _buildDrawerMenuItem(
            onTap: () => Log.d('Foods'),
            icon: const Icon(Icons.fastfood, color: Colors.black),
            title: 'Foods',
          ),
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context, Resource<List<DrinkModel>?> state) {
    return _buildDrinkTabs(state);
  }

  @override
  Widget buildBodyLoading(
      BuildContext context, Resource<List<DrinkModel>?> state) {
    return const Center(child: CircularProgressIndicator());
  }

  ///========================= PRIVATE METHOD =========================///
  Widget _buildDrinkTabs(Resource<List<DrinkModel>?> state) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
      itemCount: state.data?.length,
      itemBuilder: (context, index) {
        return _buildDrinkTab(
          state.data?[index],
        );
      },
    );
  }

  Widget _buildDrinkTab(DrinkModel? model) {
    if (model == null) return Space.empty;
    return InkWell(
      onTap: () {
        pushScreen(
          routeDrinkDetails,
          queryParams: {'id': model.id},
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12.0),
        color: Colors.grey[300],
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(48),
                    child: model.thumbnailUrl.isNotNullOrEmpty
                        ? Image.network(model.thumbnailUrl)
                        : const Icon(Icons.image),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  model.name,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerMenuItem(
      {required Icon icon, required String title, Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(title),
    );
  }

  Widget _buildLoggedOutPopupMenuButton() {
    return PopupMenuButton(
      icon: const Icon(Icons.more_horiz),
      itemBuilder: (context) {
        return [
          const PopupMenuItem<int>(
            value: 0,
            child: Text('Login'),
          ),
          const PopupMenuItem<int>(
            value: 1,
            child: Text('Settings'),
          ),
          const PopupMenuItem<int>(
            value: 2,
            child: Text('About'),
          ),
        ];
      },
      onSelected: (value) {
        switch (value) {
          case 0:
            Log.d('Login is selected.');
            break;
          case 1:
            Log.d('Settings is selected.');
            pushScreen(routeSettings);
            break;
          case 2:
            Log.d('About is selected.');
            pushScreen(routeAbout);
            break;
        }
      },
    );
  }

  Widget _buildLoggedInPopupMenuButton() {
    return PopupMenuButton(
      icon: const Icon(Icons.more_horiz),
      itemBuilder: (context) {
        return [
          const PopupMenuItem<int>(
            value: 0,
            child: Text('Profile'),
          ),
          const PopupMenuItem<int>(
            value: 1,
            child: Text('Settings'),
          ),
          const PopupMenuItem<int>(
            value: 2,
            child: Text('About'),
          ),
          const PopupMenuItem<int>(
            value: 3,
            child: Text('Sign-out'),
          ),
        ];
      },
      onSelected: (value) {
        switch (value) {
          case 0:
            Log.d('Login is selected.');
            break;
          case 1:
            Log.d('Settings is selected.');
            break;
          case 2:
            Log.d('About is selected.');
            break;
          case 3:
            Log.d('Sign-out is selected.');
            break;
        }
      },
    );
  }
}
