import '../models/userprofilelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/custom_drop_down.dart';
import 'package:hadrmouthamza/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class UserprofilelistItemWidget extends StatelessWidget {
  UserprofilelistItemWidget(
    this.userprofilelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofilelistItemModel userprofilelistItemModelObj;

  SelectionPopupModel? selectedDropDownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.outlineBlack9002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.img66x60,
                  height: 66.v,
                  width: 60.h,
                ),
                SizedBox(height: 6.v),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 63.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.v),
                          child: CustomIconButton(
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            padding: EdgeInsets.all(4.h),
                            child: CustomImageView(
                              imagePath:
                                  ImageConstant.imgCloseOnprimarycontainer,
                            ),
                          ),
                        ),
                        Text(
                          userprofilelistItemModelObj.one!,
                          style: CustomTextStyles.labelLargeBold,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.v),
                          child: CustomIconButton(
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            padding: EdgeInsets.all(3.h),
                            decoration: IconButtonStyleHelper.outlineBlackTL2,
                            child: CustomImageView(
                              imagePath:
                                  ImageConstant.imgThumbsUpOnprimarycontainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.v),
            child: Column(
              children: [
                Text(
                  userprofilelistItemModelObj.widget!,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 36.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomDropDown(
                        width: 73.h,
                        hintText: "lbl43".tr,
                        items:
                            userprofilelistItemModelObj?.dropdownItemList ?? [],
                        onChanged: (value) {
                          selectedDropDownValue = value;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 9.h),
                        child: Text(
                          userprofilelistItemModelObj.priceText!,
                          style: CustomTextStyles.titleSmallSemiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
