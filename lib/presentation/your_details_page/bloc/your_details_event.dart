// ignore_for_file: must_be_immutable

part of 'your_details_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///YourDetails widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class YourDetailsEvent extends Equatable {}

/// Event that is dispatched when the YourDetails widget is first created.
class YourDetailsInitialEvent extends YourDetailsEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends YourDetailsEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
