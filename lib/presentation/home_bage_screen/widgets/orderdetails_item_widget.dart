import '../models/orderdetails_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/custom_outlined_button.dart';

// ignore: must_be_immutable
class OrderdetailsItemWidget extends StatelessWidget {
  OrderdetailsItemWidget(
    this.orderdetailsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  OrderdetailsItemModel orderdetailsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 349.h,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: appTheme.gray50.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Container(
          height: 137.v,
          width: 349.h,
          padding: EdgeInsets.symmetric(vertical: 9.v),
          decoration: AppDecoration.outlineBlack9001.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 117.v,
                  width: 109.h,
                  margin: EdgeInsets.only(right: 6.h),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.img83x77,
                        height: 106.v,
                        width: 99.h,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 2.v),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 117.v,
                          width: 109.h,
                          decoration: BoxDecoration(
                            color: appTheme.black900.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(
                              58.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderdetailsItemModelObj.orderTitle!,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(
                      width: 221.h,
                      child: Text(
                        orderdetailsItemModelObj.orderDescription!,
                        maxLines: null,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: CustomTextStyles.labelLargeBlack900,
                      ),
                    ),
                    SizedBox(height: 11.v),
                    Row(
                      children: [
                        CustomOutlinedButton(
                          height: 24.v,
                          width: 53.h,
                          text: "lbl20".tr,
                          buttonStyle:
                              CustomButtonStyles.outlineSecondaryContainer,
                          buttonTextStyle: CustomTextStyles.labelSmallPrimary,
                        ),
                        Container(
                          width: 91.h,
                          margin: EdgeInsets.only(left: 4.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "lbl_1".tr,
                                  style: theme.textTheme.labelLarge,
                                ),
                                TextSpan(
                                  text: "lbl_50".tr,
                                  style: theme.textTheme.labelLarge,
                                ),
                                TextSpan(
                                  text: "lbl_egp".tr,
                                  style: theme.textTheme.labelLarge,
                                ),
                                TextSpan(
                                  text: " ",
                                ),
                                TextSpan(
                                  text: "lbl_185_egp".tr,
                                  style: CustomTextStyles.labelLargeBlack900_2
                                      .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
