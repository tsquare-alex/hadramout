import 'package:hadrmouthamza/features/feature/presentation/screens/feature_screen.dart';
import 'package:hadrmouthamza/features/home/presentation/screens/home_screen.dart';
import 'package:hadrmouthamza/features/splash_screen/splash_screen.dart';
import 'package:hadrmouthamza/src/app_export.dart';

part 'app_routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
// final GlobalKey<NavigatorState> _shellNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.initScreen,
    routes: [
      GoRoute(
        path: AppRoutes.initScreen,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
        ),
      ),
      // GoRoute(
      //   path: AppRoutes.featureScreen,
      //   pageBuilder: (context, state) => NoTransitionPage(
      //     key: state.pageKey,
      //     child: const FeatureScreen(),
      //   ),
      // ),
    ],
    // redirect: (context, state) {
    //   if (FirebaseAuth.instance.currentUser == null &&
    //       !state.location.endsWith(AppRoutes.initScreen)) {
    //     return '/${AppRoutes.loginScreen}';
    //   }
    //   if (FirebaseAuth.instance.currentUser != null &&
    //       state.location.startsWith('/${AppRoutes.loginScreen}')) {
    //     return '/${AppRoutes.dashboardPage.toLowerCase()}';
    //   }

    //   return null;
    // },
  );
}