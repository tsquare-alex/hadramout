import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/cart_screen.dart';
import 'package:hadrmouthamza/features/home/presentation/screens/home_screen.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/section_detalis.dart';
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
      // GoRoute(
      //   path: AppRoutes.featureScreen,
      //   pageBuilder: (context, state) => NoTransitionPage(
      //     key: state.pageKey,
      //     child: const FeatureScreen(),
      //   ),
      // ),
      GoRoute(
        path: AppRoutes.initScreen,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.sectionDetails,
        pageBuilder: (context, state) {
          final section = state.extra as SectionModel;
          return NoTransitionPage(
            key: state.pageKey,
            child: SectionDetails(section: section),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.cartScreen,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const CartScreen(),
        ),
      ),
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
