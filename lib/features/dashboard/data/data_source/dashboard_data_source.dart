import 'package:hadrmouthamza/core/common/models/order.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class DashboardDataSource {
  final _firebaseDatabase = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getOrders() async {
    return await _firebaseDatabase.collection('orders').get();
  }

  Future<void> addOrder(OrderModel order) async {
    final data = await _firebaseDatabase.collection('orders').add(order.toJson());
    await _firebaseDatabase.collection('orders').doc(data.id).update({'id': data.id});
  }
}
