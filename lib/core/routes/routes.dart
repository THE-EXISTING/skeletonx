import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/src/features/about/views/about_screen.dart';
import 'package:skeletonx/src/features/drink_detail/views/drink_home_screen.dart';
import 'package:skeletonx/src/features/settings/settings_controller.dart';
import 'package:skeletonx/src/features/settings/settings_view.dart';

const String routeHome = '/';
const String routeSettings = 'settings';
const String routeAbout = 'about';
const String routeDrinkDetails = 'drink_details';

final router = GoRouter(
  routes: [
    GoRoute(
      name: routeHome,
      path: routeHome,
      builder: (context, state) {
        return DrinksHomeScreen.create();
      },
      routes: [
        GoRoute(
          name: routeSettings,
          path: routeSettings,
          builder: (context, state) {
            return SettingsView(
              controller: SettingsController(),
            );
          },
        ),
        GoRoute(
          name: routeAbout,
          path: routeAbout,
          builder: (context, state) {
            return AboutScreen();
          },
        ),
        GoRoute(
          name: routeDrinkDetails,
          path: routeDrinkDetails,
          builder: (context, state) {
            final id = state.queryParams['id'];

            if (id == null) return Space.empty;

            return DrinkDetailScreen.create(id: id);
          },
        ),
      ],
    ),
  ],
);
