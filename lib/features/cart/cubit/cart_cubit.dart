import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository/cart_repository.dart';

part 'cart_state.dart';

class CartBloc extends Cubit<CartState> {
  final CartRepository _cartRepository;
  CartBloc(
    this._cartRepository,
  ) : super(CartInitial());

  static CartBloc get(context) => BlocProvider.of<CartBloc>(context);

  void yourFunction() {
    _cartRepository.yourFunction();
  }
}
