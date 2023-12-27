import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:hadrmouthamza/presentation/meal_details_tab_container_screen/models/meal_details_tab_container_model.dart';
part 'meal_details_tab_container_event.dart';
part 'meal_details_tab_container_state.dart';

/// A bloc that manages the state of a MealDetailsTabContainer according to the event that is dispatched to it.
class MealDetailsTabContainerBloc
    extends Bloc<MealDetailsTabContainerEvent, MealDetailsTabContainerState> {
  MealDetailsTabContainerBloc(MealDetailsTabContainerState initialState)
      : super(initialState) {
    on<MealDetailsTabContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MealDetailsTabContainerInitialEvent event,
    Emitter<MealDetailsTabContainerState> emit,
  ) async {}
}
