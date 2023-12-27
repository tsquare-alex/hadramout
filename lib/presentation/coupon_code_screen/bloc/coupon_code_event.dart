// ignore_for_file: must_be_immutable

part of 'coupon_code_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CouponCode widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CouponCodeEvent extends Equatable {}

/// Event that is dispatched when the CouponCode widget is first created.
class CouponCodeInitialEvent extends CouponCodeEvent {
  @override
  List<Object?> get props => [];
}
