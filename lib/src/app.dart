import 'dart:ui';

import 'package:hadrmouthamza/features/cart/cubit/cart_cubit.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import '../features/home/cubit/home_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(1440, 900),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<HomeBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<CartBloc>()..fetchCartItems(),
            ),
          ],
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp.router(
              title: 'Hadrmout Hamza',
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              scrollBehavior: const MaterialScrollBehavior().copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                },
              ),
              localizationsDelegates: const [
                AppLocalizationDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ar', 'EG'),
              ],
              routerDelegate: AppRouter.router.routerDelegate,
              routeInformationParser: AppRouter.router.routeInformationParser,
              routeInformationProvider:
                  AppRouter.router.routeInformationProvider,
              builder: (context, child) => ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: [
                  const Breakpoint(start: 350, end: 700, name: MOBILE),
                  const Breakpoint(start: 701, end: 950, name: TABLET),
                  const Breakpoint(start: 951, end: 1500, name: DESKTOP),
                  const Breakpoint(
                      start: 1501, end: double.infinity, name: '4K'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
