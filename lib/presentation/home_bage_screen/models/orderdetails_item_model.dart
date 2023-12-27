import '../../../core/app_export.dart';

/// This class is used in the [orderdetails_item_widget] screen.
class OrderdetailsItemModel {
  OrderdetailsItemModel({
    this.orderTitle,
    this.orderDescription,
    this.id,
  }) {
    orderTitle = orderTitle ?? "صنية الحبايب";
    orderDescription = orderDescription ??
        "4 برجدبل اتسيز برجر + 3 استربس+3 كنتوك + 3 كلو  سلو + بطاطس عائلي + مشروب 1 لتر";
    id = id ?? "";
  }

  String? orderTitle;

  String? orderDescription;

  String? id;
}
