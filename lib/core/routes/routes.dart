import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/src/features/about/views/about_screen.dart';
import 'package:skeletonx/src/features/drink_detail/views/drink_home_screen.dart';
import 'package:skeletonx/src/features/drink_detail/views/ingredient_detail_screen.dart';
import 'package:skeletonx/src/features/settings/settings_controller.dart';
import 'package:skeletonx/src/features/settings/settings_view.dart';

const String routeHome = '/';
const String routeSettings = 'settings';
const String routeAbout = 'about';
const String routeDrinkDetail = 'drink_detail';
const String routeIngredientDetail = 'ingredient_detail';

final router = GoRouter(
  routes: [
    GoRoute(
      name: routeHome,
      path: routeHome,
      pageBuilder: (context, state) => _buildPageWithCustomTransition(
        context: context,
        state: state,
        child: DrinksHomeScreen.create(),
      ),
      routes: [
        GoRoute(
          name: routeSettings,
          path: routeSettings,
          pageBuilder: (context, state) => _buildPageWithCustomTransition(
            context: context,
            state: state,
            child: SettingsView(
              controller: SettingsController(),
            ),
          ),
        ),
        GoRoute(
          name: routeAbout,
          path: routeAbout,
          pageBuilder: (context, state) => _buildPageWithCustomTransition(
            context: context,
            state: state,
            child: const AboutScreen(),
          ),
        ),
        GoRoute(
          name: routeDrinkDetail,
          path: routeDrinkDetail,
          pageBuilder: (context, state) {
            return _buildPageWithCustomTransition(
              context: context,
              state: state,
              child: DrinkDetailScreen.create(
                id: state.queryParams['id'].toString(),
              ),
            );
          },
          routes: [
            GoRoute(
              name: routeIngredientDetail,
              path: routeIngredientDetail,
              pageBuilder: (context, state) {
                return _buildPageWithCustomTransition(
                  context: context,
                  state: state,
                  child: IngredientDetailScreen.create(
                    name: state.queryParams['name'].toString(),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

CustomTransitionPage _buildPageWithCustomTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  double dx = 1.5,
  double dy = 0.0,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = Offset(dx, dy);
      const end = Offset.zero;
      const curve = Curves.easeIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
