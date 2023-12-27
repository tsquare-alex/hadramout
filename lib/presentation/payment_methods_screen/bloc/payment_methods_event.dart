// ignore_for_file: must_be_immutable

part of 'payment_methods_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///PaymentMethods widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class PaymentMethodsEvent extends Equatable {}

/// Event that is dispatched when the PaymentMethods widget is first created.
class PaymentMethodsInitialEvent extends PaymentMethodsEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends PaymentMethodsEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends PaymentMethodsEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends PaymentMethodsEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing radio button
class ChangeRadioButtonEvent extends PaymentMethodsEvent {
  ChangeRadioButtonEvent({required this.value});

  String value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends PaymentMethodsEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
