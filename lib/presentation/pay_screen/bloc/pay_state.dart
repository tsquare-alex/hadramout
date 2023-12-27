// ignore_for_file: must_be_immutable

part of 'pay_bloc.dart';

/// Represents the state of Pay in the application.
class PayState extends Equatable {
  PayState({
    this.checkmark = false,
    this.payModelObj,
  });

  PayModel? payModelObj;

  bool checkmark;

  @override
  List<Object?> get props => [
        checkmark,
        payModelObj,
      ];
  PayState copyWith({
    bool? checkmark,
    PayModel? payModelObj,
  }) {
    return PayState(
      checkmark: checkmark ?? this.checkmark,
      payModelObj: payModelObj ?? this.payModelObj,
    );
  }
}
