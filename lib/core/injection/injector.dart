import 'package:get_it/get_it.dart';
import 'package:hadrmouthamza/features/cart/cubit/cart_cubit.dart';
import 'package:hadrmouthamza/features/cart/data/data_source/cart_data_source.dart';
import 'package:hadrmouthamza/features/cart/data/repository/cart_repository.dart';
import 'package:hadrmouthamza/features/feature/cubit/feature_cubit.dart';
import 'package:hadrmouthamza/features/feature/data/data_source/feature_data_source.dart';
import 'package:hadrmouthamza/features/feature/data/repository/feature_repository.dart';
import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/features/home/data/data_source/home_data_source.dart';

import '../../features/home/data/repository/home_repository.dart';
import '../themes/cubit/app_theme_cubit.dart';

final getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  getIt.registerFactory<AppThemeBloc>(() => AppThemeBloc());
  getIt.registerFactory<FeatureBloc>(() => FeatureBloc(getIt()));
  getIt.registerFactory<CartBloc>(() => CartBloc(getIt()));
  getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt()));

  /// Data Sources
  getIt.registerLazySingleton<FeatureDataSource>(() => FeatureDataSource());
  getIt.registerLazySingleton<CartDataSource>(() => CartDataSource());
  getIt.registerLazySingleton<HomeDataSource>(() => HomeDataSource());

  /// Repository
  getIt.registerLazySingleton<FeatureRepository>(
    () => FeatureRepository(getIt()),
  );
  getIt.registerLazySingleton<CartRepository>(
    () => CartRepository(getIt()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepository(getIt()),
  );
}
