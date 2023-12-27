import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:hadrmouthamza/presentation/your_details_page/models/your_details_model.dart';
part 'your_details_event.dart';
part 'your_details_state.dart';

/// A bloc that manages the state of a YourDetails according to the event that is dispatched to it.
class YourDetailsBloc extends Bloc<YourDetailsEvent, YourDetailsState> {
  YourDetailsBloc(YourDetailsState initialState) : super(initialState) {
    on<YourDetailsInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<YourDetailsState> emit,
  ) {
    emit(state.copyWith(
      login: event.value,
    ));
  }

  _onInitialize(
    YourDetailsInitialEvent event,
    Emitter<YourDetailsState> emit,
  ) async {
    emit(state.copyWith(
      editTextController: TextEditingController(),
      login: false,
    ));
  }
}
