// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hadrmouthamza/data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import 'userprofile1_item_model.dart';

/// This class defines the variables used in the [delete_itam_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DeleteItamModel extends Equatable {
  DeleteItamModel({
    this.dropdownItemList = const [],
    this.userprofile1ItemList = const [],
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<Userprofile1ItemModel> userprofile1ItemList;

  DeleteItamModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<Userprofile1ItemModel>? userprofile1ItemList,
  }) {
    return DeleteItamModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      userprofile1ItemList: userprofile1ItemList ?? this.userprofile1ItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList, userprofile1ItemList];
}
