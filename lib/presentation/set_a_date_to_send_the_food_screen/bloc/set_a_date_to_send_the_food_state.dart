// ignore_for_file: must_be_immutable

part of 'set_a_date_to_send_the_food_bloc.dart';

/// Represents the state of SetADateToSendTheFood in the application.
class SetADateToSendTheFoodState extends Equatable {
  SetADateToSendTheFoodState({
    this.tf = false,
    this.setADateToSendTheFoodModelObj,
  });

  SetADateToSendTheFoodModel? setADateToSendTheFoodModelObj;

  bool tf;

  @override
  List<Object?> get props => [
        tf,
        setADateToSendTheFoodModelObj,
      ];
  SetADateToSendTheFoodState copyWith({
    bool? tf,
    SetADateToSendTheFoodModel? setADateToSendTheFoodModelObj,
  }) {
    return SetADateToSendTheFoodState(
      tf: tf ?? this.tf,
      setADateToSendTheFoodModelObj:
          setADateToSendTheFoodModelObj ?? this.setADateToSendTheFoodModelObj,
    );
  }
}
