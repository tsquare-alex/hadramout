// ignore_for_file: must_be_immutable

part of 'payment_methods_bloc.dart';

/// Represents the state of PaymentMethods in the application.
class PaymentMethodsState extends Equatable {
  PaymentMethodsState({
    this.checkmark = false,
    this.noKetchup = false,
    this.noTableware = false,
    this.radioGroup = "",
    this.checkmark1 = false,
    this.paymentMethodsModelObj,
  });

  PaymentMethodsModel? paymentMethodsModelObj;

  bool checkmark;

  bool noKetchup;

  bool noTableware;

  String radioGroup;

  bool checkmark1;

  @override
  List<Object?> get props => [
        checkmark,
        noKetchup,
        noTableware,
        radioGroup,
        checkmark1,
        paymentMethodsModelObj,
      ];
  PaymentMethodsState copyWith({
    bool? checkmark,
    bool? noKetchup,
    bool? noTableware,
    String? radioGroup,
    bool? checkmark1,
    PaymentMethodsModel? paymentMethodsModelObj,
  }) {
    return PaymentMethodsState(
      checkmark: checkmark ?? this.checkmark,
      noKetchup: noKetchup ?? this.noKetchup,
      noTableware: noTableware ?? this.noTableware,
      radioGroup: radioGroup ?? this.radioGroup,
      checkmark1: checkmark1 ?? this.checkmark1,
      paymentMethodsModelObj:
          paymentMethodsModelObj ?? this.paymentMethodsModelObj,
    );
  }
}
