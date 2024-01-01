import 'package:hadrmouthamza/core/common/models/order.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import '../data_source/dashboard_data_source.dart';

class DashboardRepository {
  final DashboardDataSource _dashboardDataSource;

  DashboardRepository(this._dashboardDataSource);

  Future<List<OrderModel>> getOrders() async {
    try {
      final data = await _dashboardDataSource.getOrders();
      return data.docs.map((doc) => OrderModel.fromJson(doc.data())).toList();
    } on FirebaseException catch (_) {
      return List.empty();
    }
  }

  Future<void> addOrder(OrderModel order) async {
    try {
      await _dashboardDataSource.addOrder(order);
    } on FirebaseException catch (_) {
      return;
    }
  }
}
