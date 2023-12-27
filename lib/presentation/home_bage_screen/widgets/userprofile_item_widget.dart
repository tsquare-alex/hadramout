import '../models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(
    this.userprofileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186.v,
      width: 398.h,
      margin: EdgeInsets.only(right: 16.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: userprofileItemModelObj?.userImage,
            height: 186.v,
            width: 398.h,
            radius: BorderRadius.circular(
              15.h,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.center,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder15,
              ),
              child: Container(
                height: 186.v,
                width: 398.h,
                padding: EdgeInsets.symmetric(horizontal: 14.h),
                decoration: AppDecoration.gradientBlackToBlack.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder15,
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40.h),
                        child: Text(
                          userprofileItemModelObj.dynamicText!,
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.v),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userprofileItemModelObj.dynamicText1!,
                              style: theme.textTheme.displaySmall,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 3.h),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.v),
                                    child: Text(
                                      userprofileItemModelObj.dynamicText2!,
                                      style: CustomTextStyles
                                          .lalezarOnPrimaryContainer,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 3.h),
                                    child: Text(
                                      userprofileItemModelObj.dynamicText3!,
                                      style: CustomTextStyles
                                          .titleLargeLalezarOnPrimaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.v),
                            CustomElevatedButton(
                              height: 35.v,
                              width: 96.h,
                              text: "lbl9".tr,
                              margin: EdgeInsets.only(left: 1.h),
                              buttonStyle: CustomButtonStyles.fillPrimary,
                              buttonTextStyle:
                                  CustomTextStyles.labelLargeOnPrimaryContainer,
                            ),
                            SizedBox(height: 4.v),
                            Padding(
                              padding: EdgeInsets.only(left: 1.h),
                              child: Text(
                                userprofileItemModelObj.dynamicText4!,
                                style: CustomTextStyles.cairoOnPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
