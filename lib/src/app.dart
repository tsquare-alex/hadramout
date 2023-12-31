import 'dart:ui';

import 'package:hadrmouthamza/src/app_export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 932),
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp.router(
            title: 'Hadrmout Hamza',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {PointerDeviceKind.mouse},
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
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 350, end: 600, name: MOBILE),
                const Breakpoint(start: 601, end: 900, name: TABLET),
                const Breakpoint(start: 901, end: 1200, name: DESKTOP),
                const Breakpoint(start: 1201, end: double.infinity, name: '4K'),
              ],
            ),
          ),
        );
      },
    );
  }
}
