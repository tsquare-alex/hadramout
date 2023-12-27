// ignore_for_file: must_be_immutable

part of 'your_details_tab_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///YourDetailsTabContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class YourDetailsTabContainerEvent extends Equatable {}

/// Event that is dispatched when the YourDetailsTabContainer widget is first created.
class YourDetailsTabContainerInitialEvent extends YourDetailsTabContainerEvent {
  @override
  List<Object?> get props => [];
}
