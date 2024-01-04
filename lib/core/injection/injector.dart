import 'package:get_it/get_it.dart';
import 'package:hadrmouthamza/features/cart/cubit/cart_cubit.dart';
import 'package:hadrmouthamza/features/cart/data/data_source/cart_data_source.dart';
import 'package:hadrmouthamza/features/cart/data/repository/cart_repository.dart';
import 'package:hadrmouthamza/features/feature/cubit/feature_cubit.dart';
import 'package:hadrmouthamza/features/feature/data/data_source/feature_data_source.dart';
import 'package:hadrmouthamza/features/feature/data/repository/feature_repository.dart';

import '../themes/cubit/app_theme_cubit.dart';

final getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  getIt.registerFactory<AppThemeBloc>(() => AppThemeBloc());
  getIt.registerFactory<FeatureBloc>(() => FeatureBloc(getIt()));
  getIt.registerFactory<CartBloc>(() => CartBloc(getIt()));

  /// Data Sources
  getIt.registerLazySingleton<FeatureDataSource>(() => FeatureDataSource());
  getIt.registerLazySingleton<CartDataSource>(() => CartDataSource());

  /// Repository
  getIt.registerLazySingleton<FeatureRepository>(
    () => FeatureRepository(getIt()),
  );
  getIt.registerLazySingleton<CartRepository>(
    () => CartRepository(getIt()),
  );
}
