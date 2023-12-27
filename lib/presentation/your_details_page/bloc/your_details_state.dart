// ignore_for_file: must_be_immutable

part of 'your_details_bloc.dart';

/// Represents the state of YourDetails in the application.
class YourDetailsState extends Equatable {
  YourDetailsState({
    this.editTextController,
    this.login = false,
    this.yourDetailsModelObj,
  });

  TextEditingController? editTextController;

  YourDetailsModel? yourDetailsModelObj;

  bool login;

  @override
  List<Object?> get props => [
        editTextController,
        login,
        yourDetailsModelObj,
      ];
  YourDetailsState copyWith({
    TextEditingController? editTextController,
    bool? login,
    YourDetailsModel? yourDetailsModelObj,
  }) {
    return YourDetailsState(
      editTextController: editTextController ?? this.editTextController,
      login: login ?? this.login,
      yourDetailsModelObj: yourDetailsModelObj ?? this.yourDetailsModelObj,
    );
  }
}
