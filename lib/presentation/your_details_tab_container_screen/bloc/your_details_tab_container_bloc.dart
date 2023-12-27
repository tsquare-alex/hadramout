import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:hadrmouthamza/presentation/your_details_tab_container_screen/models/your_details_tab_container_model.dart';
part 'your_details_tab_container_event.dart';
part 'your_details_tab_container_state.dart';

/// A bloc that manages the state of a YourDetailsTabContainer according to the event that is dispatched to it.
class YourDetailsTabContainerBloc
    extends Bloc<YourDetailsTabContainerEvent, YourDetailsTabContainerState> {
  YourDetailsTabContainerBloc(YourDetailsTabContainerState initialState)
      : super(initialState) {
    on<YourDetailsTabContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    YourDetailsTabContainerInitialEvent event,
    Emitter<YourDetailsTabContainerState> emit,
  ) async {}
}
