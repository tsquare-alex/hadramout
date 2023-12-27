import 'package:hadrmouthamza/data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';

/// This class is used in the [userprofilelist_item_widget] screen.
class UserprofilelistItemModel {
  UserprofilelistItemModel({
    this.one,
    this.widget,
    this.dropdownItemList,
    this.priceText,
    this.id,
  }) {
    one = one ?? "1";
    widget = widget ?? "صنيه الحبايب - عروض حصريه";
    dropdownItemList = dropdownItemList ??
        [
          SelectionPopupModel(
            id: 1,
            title: "Item One",
            isSelected: true,
          ),
          SelectionPopupModel(
            id: 2,
            title: "Item Two",
          ),
          SelectionPopupModel(
            id: 3,
            title: "Item Three",
          )
        ];
    priceText = priceText ?? "500EGP";
    id = id ?? "";
  }

  String? one;

  String? widget;

  List<SelectionPopupModel>? dropdownItemList;

  String? priceText;

  String? id;
}
