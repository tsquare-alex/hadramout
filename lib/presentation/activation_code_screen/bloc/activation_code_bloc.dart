import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:hadrmouthamza/presentation/activation_code_screen/models/activation_code_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'activation_code_event.dart';
part 'activation_code_state.dart';

/// A bloc that manages the state of a ActivationCode according to the event that is dispatched to it.
class ActivationCodeBloc extends Bloc<ActivationCodeEvent, ActivationCodeState>
    with CodeAutoFill {
  ActivationCodeBloc(ActivationCodeState initialState) : super(initialState) {
    on<ActivationCodeInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<ActivationCodeState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  _onInitialize(
    ActivationCodeInitialEvent event,
    Emitter<ActivationCodeState> emit,
  ) async {
    emit(state.copyWith(
      otpController: TextEditingController(),
    ));
    listenForCode();
  }
}
