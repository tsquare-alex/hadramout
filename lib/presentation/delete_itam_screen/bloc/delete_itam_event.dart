// ignore_for_file: must_be_immutable

part of 'delete_itam_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DeleteItam widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DeleteItamEvent extends Equatable {}

/// Event that is dispatched when the DeleteItam widget is first created.
class DeleteItamInitialEvent extends DeleteItamEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends DeleteItamEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends DeleteItamEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends DeleteItamEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
