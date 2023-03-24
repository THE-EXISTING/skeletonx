import 'package:skeletonx/core/core.dart';

enum DrinkHomeScreenEvent {
  loading,
}

class DrinksHomeScreen extends AppScreen {
  const DrinksHomeScreen._({required Key key}) : super(key: key);

  static Widget create() => //
      BlocProvider(
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
  bool _isLoading = false;

  @override
  void onListenEvent(BuildContext context, Object event, Object? data) {
    switch (event) {
      case DrinkHomeScreenEvent.loading:
        setState(() {
          _isLoading = data as bool;
        });
        break;
    }
  }

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
  Widget buildBodyLoading(
      BuildContext context, Resource<List<DrinkModel>?> state) {
    return buildBody(context, state);
  }

  @override
  Widget? buildDrawer(BuildContext context, Resource<List<DrinkModel>?> state) {
    return Container(
      color: Colors.blue,
      width: 150,
      child: Column(
        children: [
          _buildDrawerMenuItem(
            onTap: () => print('Drinks'),
            icon: const Icon(Icons.emoji_food_beverage, color: Colors.black),
            title: 'Drinks',
          ),
          _buildDrawerMenuItem(
            onTap: () => print('Cars'),
            icon: const Icon(Icons.car_crash_sharp, color: Colors.black),
            title: 'Cars',
          ),
          _buildDrawerMenuItem(
            onTap: () => print('Foods'),
            icon: const Icon(Icons.fastfood, color: Colors.black),
            title: 'Foods',
          ),
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context, Resource<List<DrinkModel>?> state) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : _buildDrinkTabs(state);
  }

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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DrinkDetailScreen.create(id: model.id);
            },
          ),
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
            print("Login is selected.");
            break;
          case 1:
            print("Settings is selected.");
            break;
          case 2:
            print("About is selected.");
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
            print("Login is selected.");
            break;
          case 1:
            print("Settings is selected.");
            break;
          case 2:
            print("About is selected.");
            break;
          case 3:
            print("Sign-out is selected.");
            break;
        }
      },
    );
  }
}
