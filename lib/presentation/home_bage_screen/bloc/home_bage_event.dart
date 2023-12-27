// ignore_for_file: must_be_immutable

part of 'home_bage_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HomeBage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HomeBageEvent extends Equatable {}

/// Event that is dispatched when the HomeBage widget is first created.
class HomeBageInitialEvent extends HomeBageEvent {
  @override
  List<Object?> get props => [];
}
