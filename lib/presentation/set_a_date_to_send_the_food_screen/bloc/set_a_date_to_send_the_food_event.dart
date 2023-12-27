// ignore_for_file: must_be_immutable

part of 'set_a_date_to_send_the_food_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SetADateToSendTheFood widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SetADateToSendTheFoodEvent extends Equatable {}

/// Event that is dispatched when the SetADateToSendTheFood widget is first created.
class SetADateToSendTheFoodInitialEvent extends SetADateToSendTheFoodEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends SetADateToSendTheFoodEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
