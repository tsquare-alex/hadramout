import '../../../core/app_export.dart';

/// This class is used in the [userprofile1_item_widget] screen.
class Userprofile1ItemModel {
  Userprofile1ItemModel({
    this.titleText,
    this.addText,
    this.priceText,
    this.id,
  }) {
    titleText = titleText ?? "بطاطس";
    addText = addText ?? "إضافه";
    priceText = priceText ?? "10 EGp";
    id = id ?? "";
  }

  String? titleText;

  String? addText;

  String? priceText;

  String? id;
}
