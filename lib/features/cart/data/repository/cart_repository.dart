import 'package:hadrmouthamza/features/cart/data/models/delivery.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import '../../../../core/common/models/order.dart';
import '../data_source/cart_data_source.dart';

class CartRepository {
  final CartDataSource _cartDataSource;

  CartRepository(this._cartDataSource);

  void yourFunction() {
    _cartDataSource.yourGetDataFunction();
  }

  Future<void> addOrder(OrderModel order) async {
    try {
      await _cartDataSource.addOrder(order);
    } on FirebaseException catch (_) {
      return;
    }
  }

  Future<List<DeliveryModel>> getDeliveryLocations() async {
    try {
      final data =
          await _cartDataSource.getDeliveryLocations();
      return data.docs.map((doc) => DeliveryModel.fromJson(doc.data())).toList();
    } on FirebaseException catch (_) {
      return List.empty();
    }
  }
}
