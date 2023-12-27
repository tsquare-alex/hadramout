import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
class UserprofileItemModel {
  UserprofileItemModel({
    this.userImage,
    this.dynamicText,
    this.dynamicText1,
    this.dynamicText2,
    this.dynamicText3,
    this.dynamicText4,
    this.id,
  }) {
    userImage = userImage ?? ImageConstant.imgImage9;
    dynamicText = dynamicText ?? "دبل ";
    dynamicText1 = dynamicText1 ?? " اتشيز برجر";
    dynamicText2 = dynamicText2 ?? "جنيه";
    dynamicText3 = dynamicText3 ?? "499";
    dynamicText4 = dynamicText4 ?? "تطبق الشروط والاحكام & السعر شامل الضريبه";
    id = id ?? "";
  }

  String? userImage;

  String? dynamicText;

  String? dynamicText1;

  String? dynamicText2;

  String? dynamicText3;

  String? dynamicText4;

  String? id;
}
