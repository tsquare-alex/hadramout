import 'package:hadrmouthamza/core/common/models/order.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class CartDataSource {
  void yourGetDataFunction() {}

  final _firebaseDatabase = FirebaseFirestore.instance;

  Future<void> addOrder(OrderModel order) async {
    final data = await _firebaseDatabase.collection('orders').add(order.toJson());
    await _firebaseDatabase.collection('orders').doc(data.id).update({'id': data.id});
  }

}
