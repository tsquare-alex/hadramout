// ignore_for_file: must_be_immutable

part of 'shopping_cart_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ShoppingCart widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ShoppingCartEvent extends Equatable {}

/// Event that is dispatched when the ShoppingCart widget is first created.
class ShoppingCartInitialEvent extends ShoppingCartEvent {
  @override
  List<Object?> get props => [];
}
