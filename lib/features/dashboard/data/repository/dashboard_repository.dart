import '../data_source/dashboard_data_source.dart';

class DashboardRepository {
  final DashboardDataSource _dashboardDataSource;

  DashboardRepository(this._dashboardDataSource);

  void yourFunction() {
    _dashboardDataSource.yourGetDataFunction();
  }
}
