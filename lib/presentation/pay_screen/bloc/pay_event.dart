// ignore_for_file: must_be_immutable

part of 'pay_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Pay widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class PayEvent extends Equatable {}

/// Event that is dispatched when the Pay widget is first created.
class PayInitialEvent extends PayEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends PayEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
