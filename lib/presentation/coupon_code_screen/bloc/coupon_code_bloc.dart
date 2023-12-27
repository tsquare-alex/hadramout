import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:hadrmouthamza/presentation/coupon_code_screen/models/coupon_code_model.dart';
part 'coupon_code_event.dart';
part 'coupon_code_state.dart';

/// A bloc that manages the state of a CouponCode according to the event that is dispatched to it.
class CouponCodeBloc extends Bloc<CouponCodeEvent, CouponCodeState> {
  CouponCodeBloc(CouponCodeState initialState) : super(initialState) {
    on<CouponCodeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CouponCodeInitialEvent event,
    Emitter<CouponCodeState> emit,
  ) async {
    emit(state.copyWith(
      applicationController: TextEditingController(),
    ));
  }
}
