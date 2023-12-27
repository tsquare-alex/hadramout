import '../../../core/app_export.dart';

/// This class is used in the [k0_item_widget] screen.
class K0ItemModel {
  K0ItemModel({
    this.dynamicText1,
    this.dynamicText2,
    this.id,
  }) {
    dynamicText1 = dynamicText1 ?? "غدا";
    dynamicText2 = dynamicText2 ?? "24 Dec";
    id = id ?? "";
  }

  String? dynamicText1;

  String? dynamicText2;

  String? id;
}
