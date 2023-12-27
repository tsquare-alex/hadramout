import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/k0_item_model.dart';
import 'package:hadrmouthamza/presentation/set_a_date_to_send_the_food_screen/models/set_a_date_to_send_the_food_model.dart';
part 'set_a_date_to_send_the_food_event.dart';
part 'set_a_date_to_send_the_food_state.dart';

/// A bloc that manages the state of a SetADateToSendTheFood according to the event that is dispatched to it.
class SetADateToSendTheFoodBloc
    extends Bloc<SetADateToSendTheFoodEvent, SetADateToSendTheFoodState> {
  SetADateToSendTheFoodBloc(SetADateToSendTheFoodState initialState)
      : super(initialState) {
    on<SetADateToSendTheFoodInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<SetADateToSendTheFoodState> emit,
  ) {
    emit(state.copyWith(
      tf: event.value,
    ));
  }

  List<K0ItemModel> fillK0ItemList() {
    return [
      K0ItemModel(dynamicText1: "غدا", dynamicText2: "24 Dec"),
      K0ItemModel(dynamicText1: "غدا", dynamicText2: "24 Dec"),
      K0ItemModel(dynamicText1: "غدا", dynamicText2: "24 Dec"),
      K0ItemModel(dynamicText1: "اليوم", dynamicText2: "24 Dec")
    ];
  }

  _onInitialize(
    SetADateToSendTheFoodInitialEvent event,
    Emitter<SetADateToSendTheFoodState> emit,
  ) async {
    emit(state.copyWith(
      tf: false,
    ));
    emit(state.copyWith(
        setADateToSendTheFoodModelObj:
            state.setADateToSendTheFoodModelObj?.copyWith(
      k0ItemList: fillK0ItemList(),
    )));
  }
}
