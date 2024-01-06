import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/features/home/presentation/screens/home_screen.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/casserole_section_detalis.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/chiken_section_detalis.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/drinks_sction_detalis.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/grill_section_detalis.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/kitchen_section_detalis.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/meat_section_detalis.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/salad_section_detalis.dart';
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
          child: BlocProvider(
            create: (context) => getIt<HomeBloc>(),
            child: const HomeScreen(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.chickenSection,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const ChickenSectionDetalis(),
        ),
      ),
      GoRoute(
        path: AppRoutes.casseroleSection,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const CasseroleSectionDetalis(),
        ),
      ),
      GoRoute(
        path: AppRoutes.drinksSection,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const DrinksSectionDetalis(),
        ),
      ),
      GoRoute(
        path: AppRoutes.grillSection,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const GrillSectionDetalis(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kitchenSection,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const KitchenSectionDetalis(),
        ),
      ),
      GoRoute(
        path: AppRoutes.meatSection,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const MeatSectionDetalis(),
        ),
      ),
      GoRoute(
        path: AppRoutes.saladSection,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SaladSectionDetalis(),
        ),
      )
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
