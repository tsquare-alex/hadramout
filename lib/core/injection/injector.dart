import 'package:get_it/get_it.dart';

import '../themes/cubit/app_theme_cubit.dart';

final getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  getIt.registerFactory<AppThemeBloc>(() => AppThemeBloc());

  /// Data Sources

  /// Repository
}
