// ignore_for_file: must_be_immutable

part of 'activation_code_bloc.dart';

/// Represents the state of ActivationCode in the application.
class ActivationCodeState extends Equatable {
  ActivationCodeState({
    this.otpController,
    this.activationCodeModelObj,
  });

  TextEditingController? otpController;

  ActivationCodeModel? activationCodeModelObj;

  @override
  List<Object?> get props => [
        otpController,
        activationCodeModelObj,
      ];
  ActivationCodeState copyWith({
    TextEditingController? otpController,
    ActivationCodeModel? activationCodeModelObj,
  }) {
    return ActivationCodeState(
      otpController: otpController ?? this.otpController,
      activationCodeModelObj:
          activationCodeModelObj ?? this.activationCodeModelObj,
    );
  }
}
