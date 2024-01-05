import '../data_source/home_data_source.dart';

class HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepository(this._homeDataSource);

  // Future<List<OrderModel>> getOrders() async {
  //   try {
  //     final data = await _dashboardDataSource.getOrders();
  //     return data.docs.map((doc) => OrderModel.fromJson(doc.data())).toList();
  //   } on FirebaseException catch (_) {
  //     return List.empty();
  //   }
  // }
}
