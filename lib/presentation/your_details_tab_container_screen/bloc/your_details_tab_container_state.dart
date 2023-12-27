// ignore_for_file: must_be_immutable

part of 'your_details_tab_container_bloc.dart';

/// Represents the state of YourDetailsTabContainer in the application.
class YourDetailsTabContainerState extends Equatable {
  YourDetailsTabContainerState({this.yourDetailsTabContainerModelObj});

  YourDetailsTabContainerModel? yourDetailsTabContainerModelObj;

  @override
  List<Object?> get props => [
        yourDetailsTabContainerModelObj,
      ];
  YourDetailsTabContainerState copyWith(
      {YourDetailsTabContainerModel? yourDetailsTabContainerModelObj}) {
    return YourDetailsTabContainerState(
      yourDetailsTabContainerModelObj: yourDetailsTabContainerModelObj ??
          this.yourDetailsTabContainerModelObj,
    );
  }
}
