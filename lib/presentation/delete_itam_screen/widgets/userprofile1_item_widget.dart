import '../models/userprofile1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';

// ignore: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  Userprofile1ItemWidget(
    this.userprofile1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile1ItemModel userprofile1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92.v,
      width: 78.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(4.h),
              decoration: AppDecoration.outlineBlack9004.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 35.v),
                  Text(
                    userprofile1ItemModelObj.titleText!,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodySmall8,
                  ),
                  SizedBox(
                    width: 70.h,
                    child: Divider(),
                  ),
                  SizedBox(height: 2.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.outlinePrimary4.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder2,
                        ),
                        child: SizedBox(
                          width: 11.h,
                          child: Text(
                            userprofile1ItemModelObj.addText!,
                            maxLines: null,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.cairoPrimary,
                          ),
                        ),
                      ),
                      Text(
                        userprofile1ItemModelObj.priceText!,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.cairoBlack900,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgRemovebgPreview,
            height: 50.v,
            width: 45.h,
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
