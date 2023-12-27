// ignore_for_file: must_be_immutable

part of 'meal_details_tab_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MealDetailsTabContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MealDetailsTabContainerEvent extends Equatable {}

/// Event that is dispatched when the MealDetailsTabContainer widget is first created.
class MealDetailsTabContainerInitialEvent extends MealDetailsTabContainerEvent {
  @override
  List<Object?> get props => [];
}
