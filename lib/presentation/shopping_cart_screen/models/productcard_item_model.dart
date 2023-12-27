import '../../../core/app_export.dart';

/// This class is used in the [productcard_item_widget] screen.
class ProductcardItemModel {
  ProductcardItemModel({
    this.title,
    this.buttonText,
    this.price,
    this.id,
  }) {
    title = title ?? "بطاطس";
    buttonText = buttonText ?? "إضافه";
    price = price ?? "10 EGp";
    id = id ?? "";
  }

  String? title;

  String? buttonText;

  String? price;

  String? id;
}
