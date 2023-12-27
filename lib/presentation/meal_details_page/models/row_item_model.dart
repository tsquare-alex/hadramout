import '../../../core/app_export.dart';

/// This class is used in the [row_item_widget] screen.
class RowItemModel {
  RowItemModel({
    this.imageClass,
    this.text,
    this.name,
    this.id,
  }) {
    imageClass = imageClass ?? ImageConstant.imgCheckmarkPrimary16x16;
    text = text ?? "صنيه الحبايب وسط  ( EGP 300)";
    name = name ?? ImageConstant.img83x77;
    id = id ?? "";
  }

  String? imageClass;

  String? text;

  String? name;

  String? id;
}
