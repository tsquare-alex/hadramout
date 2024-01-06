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

}
