import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:hadrmouthamza/presentation/payment_methods_screen/models/payment_methods_model.dart';
part 'payment_methods_event.dart';
part 'payment_methods_state.dart';

/// A bloc that manages the state of a PaymentMethods according to the event that is dispatched to it.
class PaymentMethodsBloc
    extends Bloc<PaymentMethodsEvent, PaymentMethodsState> {
  PaymentMethodsBloc(PaymentMethodsState initialState) : super(initialState) {
    on<PaymentMethodsInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeRadioButtonEvent>(_changeRadioButton);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<PaymentMethodsState> emit,
  ) {
    emit(state.copyWith(
      checkmark: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<PaymentMethodsState> emit,
  ) {
    emit(state.copyWith(
      noKetchup: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<PaymentMethodsState> emit,
  ) {
    emit(state.copyWith(
      noTableware: event.value,
    ));
  }

  _changeRadioButton(
    ChangeRadioButtonEvent event,
    Emitter<PaymentMethodsState> emit,
  ) {
    emit(state.copyWith(
      radioGroup: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<PaymentMethodsState> emit,
  ) {
    emit(state.copyWith(
      checkmark1: event.value,
    ));
  }

  _onInitialize(
    PaymentMethodsInitialEvent event,
    Emitter<PaymentMethodsState> emit,
  ) async {
    emit(state.copyWith(
      checkmark: false,
      noKetchup: false,
      noTableware: false,
      radioGroup: "",
      checkmark1: false,
    ));
  }
}
