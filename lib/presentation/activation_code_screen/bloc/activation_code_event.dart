// ignore_for_file: must_be_immutable

part of 'activation_code_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ActivationCode widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ActivationCodeEvent extends Equatable {}

/// Event that is dispatched when the ActivationCode widget is first created.
class ActivationCodeInitialEvent extends ActivationCodeEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends ActivationCodeEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
