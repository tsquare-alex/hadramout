import '../data_source/home_data_source.dart';

class HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepository(this._homeDataSource);

  void yourFunction() {
    _homeDataSource.yourGetDataFunction();
  }
}
