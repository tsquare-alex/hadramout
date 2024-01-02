import '../data_source/cart_data_source.dart';

class CartRepository {
  final CartDataSource _cartDataSource;

  CartRepository(this._cartDataSource);

  void yourFunction() {
    _cartDataSource.yourGetDataFunction();
  }
}
