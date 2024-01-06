part of 'cart_cubit.dart';

class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class AddOrderCartLoading extends CartState {}
class AddOrderCartSuccess extends CartState {}

class AddOrderSpeciesLoading extends CartState {}
class AddOrderSpeciesSuccess extends CartState {}
class AddOrderSpeciesError extends CartState {}

class SelectDeliveryLoading extends CartState {}
class SelectDeliverySuccess extends CartState {}

class SelectMethodLoading extends CartState {}
class SelectMethodSuccess extends CartState {}

class SelectDateLoading extends CartState {}
class SelectDateSuccess extends CartState {}

class AddToCartLoading extends CartState {}
class AddToCartSuccess extends CartState {}
