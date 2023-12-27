import 'bloc/pay_bloc.dart';
import 'models/pay_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/custom_checkbox_button.dart';
import 'package:hadrmouthamza/widgets/custom_elevated_button.dart';
import 'package:hadrmouthamza/widgets/custom_outlined_button.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<PayBloc>(
      create: (context) => PayBloc(PayState(
        payModelObj: PayModel(),
      ))
        ..add(PayInitialEvent()),
      child: PayScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 38.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lbl23".tr,
                                style: theme.textTheme.titleLarge,
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgArrowLeft,
                                height: 13.v,
                                width: 16.h,
                                margin: EdgeInsets.only(
                                  left: 16.h,
                                  top: 8.v,
                                  bottom: 15.v,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.v),
                        _buildUserProfileColumn(context),
                        SizedBox(height: 20.v),
                        _buildImageFrameRow(context),
                        SizedBox(height: 20.v),
                        _buildColumn(context),
                        SizedBox(height: 20.v),
                        _buildWithoutKetchupRow(context),
                        SizedBox(height: 19.v),
                        _buildFrameRow(context),
                        SizedBox(height: 90.v),
                        _buildSelectPaymentMethodButton(context),
                        SizedBox(height: 87.v),
                        _buildViewRow(context),
                        SizedBox(height: 16.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "msg14".tr,
                            textAlign: TextAlign.right,
                            style: CustomTextStyles.labelLargeBlack900_1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildChangeButton(BuildContext context) {
    return CustomOutlinedButton(
      height: 33.v,
      width: 59.h,
      text: "lbl24".tr,
      margin: EdgeInsets.symmetric(vertical: 10.v),
      buttonTextStyle: CustomTextStyles.titleSmallPrimary,
    );
  }

  /// Section Widget
  Widget _buildUserProfileColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildChangeButton(context),
          Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "lbl_mohamed".tr,
                  style: CustomTextStyles.titleMediumMedium,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgCall,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.symmetric(vertical: 3.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Text(
                      "msg_20_1283082853".tr,
                      style: CustomTextStyles.labelLargeBlack900_3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildImageFrameRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.outlineBlack9002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 4.v),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 4.v,
                          bottom: 6.v,
                        ),
                        padding: EdgeInsets.all(1.h),
                        decoration: AppDecoration.outlinePrimary1.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Container(
                          height: 9.adaptSize,
                          width: 9.adaptSize,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(
                              4.h,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "lbl25".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 6.v),
                  Divider(
                    color: appTheme.black900.withOpacity(0.1),
                  ),
                  SizedBox(height: 10.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgContrast,
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                        margin: EdgeInsets.only(
                          top: 2.v,
                          bottom: 8.v,
                        ),
                      ),
                      Text(
                        "lbl26".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 75.adaptSize,
            width: 75.adaptSize,
            margin: EdgeInsets.only(left: 12.h),
            padding: EdgeInsets.symmetric(vertical: 9.v),
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder37,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgFrameGray20070x70,
              height: 55.v,
              width: 75.h,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildChangeButton1(BuildContext context) {
    return CustomOutlinedButton(
      height: 33.v,
      width: 59.h,
      text: "lbl24".tr,
      margin: EdgeInsets.only(bottom: 1.v),
      buttonTextStyle: CustomTextStyles.titleSmallPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: AppDecoration.outlineBlack9002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildChangeButton1(context),
              Padding(
                padding: EdgeInsets.only(top: 4.v),
                child: Text(
                  "msg9".tr,
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 43.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 11.h,
                        vertical: 2.v,
                      ),
                      decoration: AppDecoration.fillPrimary1.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl27".tr,
                        style: CustomTextStyles.labelSmallOnPrimaryContainer,
                      ),
                    ),
                    Text(
                      "msg_d1_mohamed_motasem".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(
                      width: 310.h,
                      child: Text(
                        "msg10".tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: CustomTextStyles.bodySmallBlack90010,
                      ),
                    ),
                  ],
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgTelevisionBlack900,
                height: 42.v,
                width: 50.h,
                margin: EdgeInsets.only(
                  left: 12.h,
                  bottom: 20.v,
                ),
              ),
            ],
          ),
          SizedBox(height: 11.v),
          Align(
            alignment: Alignment.centerRight,
            child: BlocSelector<PayBloc, PayState, bool?>(
              selector: (state) => state.checkmark,
              builder: (context, checkmark) {
                return CustomCheckboxButton(
                  alignment: Alignment.centerRight,
                  width: 148.h,
                  text: "msg_100".tr,
                  value: checkmark,
                  textStyle: theme.textTheme.labelLarge,
                  isRightCheck: true,
                  onChange: (value) {
                    context
                        .read<PayBloc>()
                        .add(ChangeCheckBoxEvent(value: value));
                  },
                );
              },
            ),
          ),
          SizedBox(height: 10.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 18.v,
                width: 20.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 2.h,
                  vertical: 1.v,
                ),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder2,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgTelevisionPrimary,
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                  alignment: Alignment.topCenter,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.v),
                child: Text(
                  "msg11".tr,
                  style: theme.textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWithoutKetchupButton(BuildContext context) {
    return Expanded(
      child: CustomOutlinedButton(
        text: "lbl29".tr,
        margin: EdgeInsets.only(right: 8.h),
        buttonTextStyle: CustomTextStyles.bodySmallPrimary,
      ),
    );
  }

  /// Section Widget
  Widget _buildWithoutTableAccessoriesButton(BuildContext context) {
    return Expanded(
      child: CustomOutlinedButton(
        text: "msg13".tr,
        margin: EdgeInsets.only(left: 8.h),
        buttonTextStyle: CustomTextStyles.bodySmallPrimary,
      ),
    );
  }

  /// Section Widget
  Widget _buildWithoutKetchupRow(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack9002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 11.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "lbl28".tr,
                    style: CustomTextStyles.labelLargeSemiBold,
                  ),
                  SizedBox(height: 3.v),
                  Text(
                    "msg12".tr,
                    style: CustomTextStyles.bodySmallBlack9009,
                  ),
                  SizedBox(height: 10.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildWithoutKetchupButton(context),
                      _buildWithoutTableAccessoriesButton(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 115.v,
            width: 7.h,
            margin: EdgeInsets.only(left: 12.h),
            decoration: BoxDecoration(
              color: appTheme.lime500,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(10.h),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameRow(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack9003.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: DottedBorder(
        color: appTheme.black900.withOpacity(0.5),
        padding: EdgeInsets.only(
          left: 1.h,
          top: 1.v,
          right: 1.h,
          bottom: 1.v,
        ),
        strokeWidth: 1.h,
        radius: Radius.circular(10),
        borderType: BorderType.RRect,
        dashPattern: [
          2,
          5,
        ],
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 16.adaptSize,
                width: 16.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 7.v),
                padding: EdgeInsets.symmetric(
                  horizontal: 4.h,
                  vertical: 6.v,
                ),
                decoration: AppDecoration.fillPrimary1.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgVectorOnprimarycontainer4x6,
                  height: 4.v,
                  width: 6.h,
                  alignment: Alignment.centerRight,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.h,
                  top: 1.v,
                ),
                child: Text(
                  "lbl_525_egp".tr,
                  style: CustomTextStyles.titleMediumBold,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 4.v),
                child: Text(
                  "lbl30".tr,
                  style: theme.textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSelectPaymentMethodButton(BuildContext context) {
    return CustomElevatedButton(
      height: 61.v,
      text: "lbl31".tr,
      buttonTextStyle: CustomTextStyles.titleLargeOnPrimaryContainerBold,
    );
  }

  /// Section Widget
  Widget _buildViewRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.v),
            padding: EdgeInsets.all(1.h),
            decoration: AppDecoration.outlinePrimary1.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Container(
              height: 9.adaptSize,
              width: 9.adaptSize,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(
                  4.h,
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 9.v),
            child: Text(
              "lbl32".tr,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgRemovebgPreview,
            height: 39.v,
            width: 35.h,
            margin: EdgeInsets.only(left: 16.h),
          ),
        ],
      ),
    );
  }
}
