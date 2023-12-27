// ignore_for_file: must_be_immutable

part of 'coupon_code_bloc.dart';

/// Represents the state of CouponCode in the application.
class CouponCodeState extends Equatable {
  CouponCodeState({
    this.applicationController,
    this.couponCodeModelObj,
  });

  TextEditingController? applicationController;

  CouponCodeModel? couponCodeModelObj;

  @override
  List<Object?> get props => [
        applicationController,
        couponCodeModelObj,
      ];
  CouponCodeState copyWith({
    TextEditingController? applicationController,
    CouponCodeModel? couponCodeModelObj,
  }) {
    return CouponCodeState(
      applicationController:
          applicationController ?? this.applicationController,
      couponCodeModelObj: couponCodeModelObj ?? this.couponCodeModelObj,
    );
  }
}
