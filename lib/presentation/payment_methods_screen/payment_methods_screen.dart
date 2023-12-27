import 'bloc/payment_methods_bloc.dart';
import 'models/payment_methods_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/custom_checkbox_button.dart';
import 'package:hadrmouthamza/widgets/custom_elevated_button.dart';
import 'package:hadrmouthamza/widgets/custom_icon_button.dart';
import 'package:hadrmouthamza/widgets/custom_outlined_button.dart';
import 'package:hadrmouthamza/widgets/custom_radio_button.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<PaymentMethodsBloc>(
      create: (context) => PaymentMethodsBloc(PaymentMethodsState(
        paymentMethodsModelObj: PaymentMethodsModel(),
      ))
        ..add(PaymentMethodsInitialEvent()),
      child: PaymentMethodsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 895.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
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
                              _buildRowWithColumn(context),
                              SizedBox(height: 20.v),
                              _buildRowWithFrame(context),
                              SizedBox(height: 20.v),
                              _buildColumnWithFrames(context),
                              SizedBox(height: 20.v),
                              _buildRowWithNoKetchup(context),
                              SizedBox(height: 19.v),
                              _buildRowWithRadio(context),
                              SizedBox(height: 90.v),
                              _buildColumnWithFrame(context),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: AppDecoration.fillBlack,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: 397.v),
                              CustomIconButton(
                                height: 39.v,
                                width: 40.h,
                                padding: EdgeInsets.all(13.h),
                                decoration: IconButtonStyleHelper
                                    .fillOnPrimaryContainer,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgCloseBlack900,
                                ),
                              ),
                              SizedBox(height: 16.v),
                              _buildColumnWithFrames1(context),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 53.v),
                _buildView(context),
                SizedBox(height: 16.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.h),
                    child: Text(
                      "msg14".tr,
                      textAlign: TextAlign.right,
                      style: CustomTextStyles.labelLargeBlack900_1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowWithColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 9.v,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 59.h,
            margin: EdgeInsets.symmetric(vertical: 10.v),
            padding: EdgeInsets.symmetric(
              horizontal: 17.h,
              vertical: 1.v,
            ),
            decoration: AppDecoration.outlinePrimary2.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Text(
              "lbl24".tr,
              style: CustomTextStyles.titleSmallPrimary,
            ),
          ),
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
  Widget _buildRowWithFrame(BuildContext context) {
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
  Widget _buildColumnWithFrames(BuildContext context) {
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
              Container(
                width: 59.h,
                margin: EdgeInsets.only(bottom: 1.v),
                padding: EdgeInsets.symmetric(
                  horizontal: 17.h,
                  vertical: 1.v,
                ),
                decoration: AppDecoration.outlinePrimary2.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                child: Text(
                  "lbl24".tr,
                  style: CustomTextStyles.titleSmallPrimary,
                ),
              ),
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
            child: BlocSelector<PaymentMethodsBloc, PaymentMethodsState, bool?>(
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
                        .read<PaymentMethodsBloc>()
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
  Widget _buildRowWithNoKetchup(BuildContext context) {
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.h),
                          child: BlocSelector<PaymentMethodsBloc,
                              PaymentMethodsState, bool?>(
                            selector: (state) => state.noKetchup,
                            builder: (context, noKetchup) {
                              return CustomCheckboxButton(
                                text: "lbl29".tr,
                                value: noKetchup,
                                padding:
                                    EdgeInsets.fromLTRB(10.h, 6.v, 30.h, 6.v),
                                onChange: (value) {
                                  context
                                      .read<PaymentMethodsBloc>()
                                      .add(ChangeCheckBox1Event(value: value));
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: BlocSelector<PaymentMethodsBloc,
                              PaymentMethodsState, bool?>(
                            selector: (state) => state.noTableware,
                            builder: (context, noTableware) {
                              return CustomCheckboxButton(
                                text: "msg13".tr,
                                value: noTableware,
                                padding:
                                    EdgeInsets.fromLTRB(10.h, 6.v, 26.h, 6.v),
                                onChange: (value) {
                                  context
                                      .read<PaymentMethodsBloc>()
                                      .add(ChangeCheckBox2Event(value: value));
                                },
                              );
                            },
                          ),
                        ),
                      ),
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
  Widget _buildRowWithRadio(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocSelector<PaymentMethodsBloc, PaymentMethodsState, String?>(
                selector: (state) => state.radioGroup,
                builder: (context, radioGroup) {
                  return Padding(
                    padding: EdgeInsets.only(top: 1.v),
                    child: CustomRadioButton(
                      text: "lbl_525_egp".tr,
                      value: "lbl_525_egp".tr,
                      groupValue: radioGroup,
                      textStyle: CustomTextStyles.titleMediumBold,
                      onChange: (value) {
                        context
                            .read<PaymentMethodsBloc>()
                            .add(ChangeRadioButtonEvent(value: value));
                      },
                    ),
                  );
                },
              ),
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
  Widget _buildColumnWithFrame(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 125.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.fillPrimary1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 7.v),
          Text(
            "lbl31".tr,
            style: CustomTextStyles.titleLargeOnPrimaryContainerBold,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnWithFrames1(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGroup40890,
            height: 31.v,
            width: 108.h,
          ),
          SizedBox(height: 17.v),
          Text(
            "lbl36".tr,
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 17.v),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 11.h,
              vertical: 8.v,
            ),
            decoration: AppDecoration.outlinePrimary3.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.v),
                  padding: EdgeInsets.all(2.h),
                  decoration: AppDecoration.outlinePrimary1.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Container(
                    height: 11.adaptSize,
                    width: 11.adaptSize,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(
                        5.h,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 6.v,
                    bottom: 3.v,
                  ),
                  child: Text(
                    "lbl37".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgIcons8Card501,
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  margin: EdgeInsets.only(
                    left: 12.h,
                    right: 4.h,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.v),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 9.v,
            ),
            decoration: AppDecoration.outlineBlack9002.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 10.v),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                    borderRadius: BorderRadius.circular(
                      10.h,
                    ),
                    border: Border.all(
                      color: appTheme.gray20001,
                      width: 2.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 7.v,
                          bottom: 2.v,
                        ),
                        child: Text(
                          "msg17".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgIcons8Cash481,
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        margin: EdgeInsets.only(left: 11.h),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.v),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 9.v,
            ),
            decoration: AppDecoration.outlineBlack9002.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 10.v),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                    borderRadius: BorderRadius.circular(
                      10.h,
                    ),
                    border: Border.all(
                      color: appTheme.gray20001,
                      width: 2.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 7.v,
                          bottom: 2.v,
                        ),
                        child: Text(
                          "lbl38".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgIcons8Wallet50,
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        margin: EdgeInsets.only(left: 13.h),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 13.v),
          Align(
            alignment: Alignment.centerRight,
            child: BlocSelector<PaymentMethodsBloc, PaymentMethodsState, bool?>(
              selector: (state) => state.checkmark1,
              builder: (context, checkmark1) {
                return CustomCheckboxButton(
                  alignment: Alignment.centerRight,
                  width: 192.h,
                  text: "msg18".tr,
                  value: checkmark1,
                  textStyle: CustomTextStyles.labelLargeBlack900SemiBold,
                  isRightCheck: true,
                  onChange: (value) {
                    context
                        .read<PaymentMethodsBloc>()
                        .add(ChangeCheckBox3Event(value: value));
                  },
                );
              },
            ),
          ),
          SizedBox(height: 13.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomElevatedButton(
                  height: 62.v,
                  text: "lbl39".tr,
                  margin: EdgeInsets.only(right: 9.h),
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  buttonTextStyle:
                      CustomTextStyles.titleLargeOnPrimaryContainerBold,
                ),
              ),
              Expanded(
                child: CustomOutlinedButton(
                  height: 62.v,
                  text: "lbl40".tr,
                  margin: EdgeInsets.only(left: 9.h),
                  buttonTextStyle: CustomTextStyles.titleLargePrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 19.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildView(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
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
