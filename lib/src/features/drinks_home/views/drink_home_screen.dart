import 'package:skeletonx/core/core.dart';

class DrinksHomeScreen extends AppScreen {
  const DrinksHomeScreen._({required Key key}) : super(key: key);

  static Widget create({required String id}) => //
      BlocProvider(
        create: (context) =>
            CocktailBloc(id: id)..addInitEvent(CocktailEvent.loadDrink),
        child: const DrinksHomeScreen._(
          key: Key('DrinksHomeScreen'),
        ),
      );

  @override
  State<DrinksHomeScreen> createState() => _DrinksHomeScreenState();
}

class _DrinksHomeScreenState extends AppScreenLocaleScaffoldBlocState<
    DrinksHomeScreen, CocktailBloc, Resource<DrinkModel?>> {
  @override
  Future<bool> onWillPop(Resource<DrinkModel?> resource) {
    return Future.value(false);
  }

  @override
  PreferredSizeWidget? buildAppBar(Resource<DrinkModel?> state) {
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
  Widget buildBodyLoading(BuildContext context, Resource<DrinkModel?> state) {
    return buildBody(context, state);
  }

  @override
  Widget buildBody(BuildContext context, Resource<DrinkModel?> state) {
    return Container();
  }

  @override
  Widget? buildDrawer(BuildContext context, Resource<DrinkModel?> state) {
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

  ListTile _buildDrawerMenuItem(
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
