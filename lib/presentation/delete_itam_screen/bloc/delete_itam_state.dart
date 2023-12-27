// ignore_for_file: must_be_immutable

part of 'delete_itam_bloc.dart';

/// Represents the state of DeleteItam in the application.
class DeleteItamState extends Equatable {
  DeleteItamState({
    this.selectedDropDownValue,
    this.tf2 = false,
    this.tf3 = false,
    this.deleteItamModelObj,
  });

  SelectionPopupModel? selectedDropDownValue;

  DeleteItamModel? deleteItamModelObj;

  bool tf2;

  bool tf3;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        tf2,
        tf3,
        deleteItamModelObj,
      ];
  DeleteItamState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    bool? tf2,
    bool? tf3,
    DeleteItamModel? deleteItamModelObj,
  }) {
    return DeleteItamState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      tf2: tf2 ?? this.tf2,
      tf3: tf3 ?? this.tf3,
      deleteItamModelObj: deleteItamModelObj ?? this.deleteItamModelObj,
    );
  }
}
