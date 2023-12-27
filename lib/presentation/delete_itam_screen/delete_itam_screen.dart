import '../delete_itam_screen/widgets/userprofile1_item_widget.dart';
import 'bloc/delete_itam_bloc.dart';
import 'models/delete_itam_model.dart';
import 'models/userprofile1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_subtitle.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_title_button.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hadrmouthamza/widgets/app_bar/custom_app_bar.dart';
import 'package:hadrmouthamza/widgets/custom_checkbox_button.dart';
import 'package:hadrmouthamza/widgets/custom_drop_down.dart';
import 'package:hadrmouthamza/widgets/custom_elevated_button.dart';
import 'package:hadrmouthamza/widgets/custom_icon_button.dart';
import 'package:hadrmouthamza/widgets/custom_outlined_button.dart';

class DeleteItamScreen extends StatelessWidget {
  const DeleteItamScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<DeleteItamBloc>(
      create: (context) => DeleteItamBloc(DeleteItamState(
        deleteItamModelObj: DeleteItamModel(),
      ))
        ..add(DeleteItamInitialEvent()),
      child: DeleteItamScreen(),
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
                  height: 936.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      _buildRowView(context),
                      _buildRowCheckmark(context),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.h,
                            top: 37.v,
                            right: 16.h,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildAppBar(context),
                              SizedBox(height: 15.v),
                              _buildColumnFrame(context),
                              SizedBox(height: 16.v),
                              _buildStackDetails(context),
                              SizedBox(height: 16.v),
                              _buildColumnFrame1(context),
                              SizedBox(height: 16.v),
                              _buildColumnFrame2(context),
                              SizedBox(height: 16.v),
                              _buildRowWithoutKetchup(context),
                            ],
                          ),
                        ),
                      ),
                      _buildColumnUserProfile(context),
                      _buildRowArrowLeft(context),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          decoration: AppDecoration.fillBlack,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: 384.v),
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
                              _buildTen(context),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.v),
                _buildRowView1(context),
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
  Widget _buildRowView(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: 16.h,
          top: 872.v,
          right: 16.h,
        ),
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
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
      ),
    );
  }

  /// Section Widget
  Widget _buildRowCheckmark(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.fromLTRB(16.h, 788.v, 16.h, 84.v),
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgCheckmarkPrimary16x16,
              height: 16.adaptSize,
              width: 16.adaptSize,
              margin: EdgeInsets.only(
                left: 4.h,
                top: 12.v,
                bottom: 12.v,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: 10.v,
                bottom: 6.v,
              ),
              child: Text(
                "lbl32".tr,
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
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 39.v,
      title: Padding(
        padding: EdgeInsets.only(left: 16.h),
        child: Row(
          children: [
            AppbarTitleButton(),
            AppbarSubtitleOne(
              text: "msg_22".tr,
              margin: EdgeInsets.only(
                left: 104.h,
                top: 5.v,
                bottom: 5.v,
              ),
            ),
          ],
        ),
      ),
      actions: [
        AppbarSubtitle(
          text: "lbl42".tr,
          margin: EdgeInsets.only(
            left: 12.h,
            top: 1.v,
          ),
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.fromLTRB(12.h, 10.v, 16.h, 15.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildColumnFrame(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.outlineBlack9002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildWidget(
            context,
            messageText: "msg19".tr,
          ),
          SizedBox(height: 3.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 63.h,
                margin: EdgeInsets.only(top: 2.v),
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
                          imagePath: ImageConstant.imgCloseOnprimarycontainer,
                        ),
                      ),
                    ),
                    Text(
                      "lbl_1".tr,
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
              Spacer(),
              BlocSelector<DeleteItamBloc, DeleteItamState, DeleteItamModel?>(
                selector: (state) => state.deleteItamModelObj,
                builder: (context, deleteItamModelObj) {
                  return CustomDropDown(
                    width: 73.h,
                    hintText: "lbl43".tr,
                    items: deleteItamModelObj?.dropdownItemList ?? [],
                    onChanged: (value) {
                      context
                          .read<DeleteItamBloc>()
                          .add(ChangeDropDownEvent(value: value));
                    },
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 9.h),
                child: Text(
                  "lbl_500egp".tr,
                  style: CustomTextStyles.titleSmallSemiBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTf(BuildContext context) {
    return CustomElevatedButton(
      height: 27.v,
      width: 73.h,
      text: "lbl43".tr,
      buttonStyle: CustomButtonStyles.fillPrimaryTL3,
      buttonTextStyle: CustomTextStyles.labelLargePrimarySemiBold,
    );
  }

  /// Section Widget
  Widget _buildStackDetails(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Container(
        height: 123.v,
        width: 398.h,
        padding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 9.v,
        ),
        decoration: AppDecoration.outlineBlack9002.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.img66x60,
              height: 66.v,
              width: 60.h,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 1.v),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "msg19".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 17.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildTf(context),
                      Padding(
                        padding: EdgeInsets.only(left: 9.h),
                        child: Text(
                          "lbl_500egp".tr,
                          style: CustomTextStyles.titleSmallSemiBold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 1.v,
                          bottom: 3.v,
                        ),
                        child: CustomIconButton(
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                          padding: EdgeInsets.all(4.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgCloseOnprimarycontainer,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          bottom: 1.v,
                        ),
                        child: Text(
                          "lbl_1".tr,
                          style: CustomTextStyles.labelLargeBold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 9.h,
                          top: 1.v,
                          bottom: 3.v,
                        ),
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
                      Padding(
                        padding: EdgeInsets.only(
                          left: 132.h,
                          top: 5.v,
                        ),
                        child: Text(
                          "msg20".tr,
                          style: theme.textTheme.labelMedium,
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
    );
  }

  /// Section Widget
  Widget _buildTf1(BuildContext context) {
    return CustomElevatedButton(
      height: 27.v,
      width: 73.h,
      text: "lbl43".tr,
      buttonStyle: CustomButtonStyles.fillPrimaryTL3,
      buttonTextStyle: CustomTextStyles.labelLargePrimarySemiBold,
    );
  }

  /// Section Widget
  Widget _buildColumnFrame1(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.outlineBlack9002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildWidget(
            context,
            messageText: "msg19".tr,
          ),
          SizedBox(height: 3.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.v),
                child: CustomIconButton(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  padding: EdgeInsets.all(4.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCloseOnprimarycontainer,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.h,
                  top: 2.v,
                ),
                child: Text(
                  "lbl_1".tr,
                  style: CustomTextStyles.labelLargeBold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 9.h,
                  top: 3.v,
                  bottom: 3.v,
                ),
                child: CustomIconButton(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  padding: EdgeInsets.all(3.h),
                  decoration: IconButtonStyleHelper.outlineBlackTL2,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgThumbsUpOnprimarycontainer,
                  ),
                ),
              ),
              Spacer(),
              _buildTf1(context),
              Padding(
                padding: EdgeInsets.only(left: 9.h),
                child: Text(
                  "lbl_500egp".tr,
                  style: CustomTextStyles.titleSmallSemiBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnFrame2(BuildContext context) {
    return Container(
      width: 398.h,
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.outlineBlack9002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Text(
            "msg21".tr,
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 1.v),
          Padding(
            padding: EdgeInsets.only(left: 28.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "msg22".tr,
                    style: CustomTextStyles.bodySmallBlack9009,
                  ),
                ),
                Container(
                  height: 15.v,
                  width: 16.h,
                  margin: EdgeInsets.only(
                    left: 4.h,
                    bottom: 3.v,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.h,
                    vertical: 1.v,
                  ),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder2,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgTelevisionPrimary,
                    height: 12.adaptSize,
                    width: 12.adaptSize,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowWithoutKetchup(BuildContext context) {
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
                          child: BlocSelector<DeleteItamBloc, DeleteItamState,
                              bool?>(
                            selector: (state) => state.tf2,
                            builder: (context, tf2) {
                              return CustomCheckboxButton(
                                text: "lbl29".tr,
                                value: tf2,
                                padding:
                                    EdgeInsets.fromLTRB(10.h, 6.v, 30.h, 6.v),
                                onChange: (value) {
                                  context
                                      .read<DeleteItamBloc>()
                                      .add(ChangeCheckBoxEvent(value: value));
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: BlocSelector<DeleteItamBloc, DeleteItamState,
                              bool?>(
                            selector: (state) => state.tf3,
                            builder: (context, tf3) {
                              return CustomCheckboxButton(
                                text: "msg13".tr,
                                value: tf3,
                                padding:
                                    EdgeInsets.fromLTRB(10.h, 6.v, 26.h, 6.v),
                                onChange: (value) {
                                  context
                                      .read<DeleteItamBloc>()
                                      .add(ChangeCheckBox1Event(value: value));
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
  Widget _buildColumnUserProfile(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 101.v),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.h),
                child: Text(
                  "lbl46".tr,
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ),
            SizedBox(height: 7.v),
            SizedBox(
              height: 92.v,
              child: BlocSelector<DeleteItamBloc, DeleteItamState,
                  DeleteItamModel?>(
                selector: (state) => state.deleteItamModelObj,
                builder: (context, deleteItamModelObj) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return SizedBox(
                        width: 12.h,
                      );
                    },
                    itemCount:
                        deleteItamModelObj?.userprofile1ItemList.length ?? 0,
                    itemBuilder: (context, index) {
                      Userprofile1ItemModel model =
                          deleteItamModelObj?.userprofile1ItemList[index] ??
                              Userprofile1ItemModel();
                      return Userprofile1ItemWidget(
                        model,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowArrowLeft(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(bottom: 41.v),
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 9.v,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 25.v),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 4.v,
                ),
                decoration: AppDecoration.fillPrimary1.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.v),
                      child: CustomIconButton(
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        padding: EdgeInsets.all(13.h),
                        decoration:
                            IconButtonStyleHelper.fillOnPrimaryContainerTL20,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgArrowLeftPrimary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.h,
                        top: 8.v,
                        bottom: 4.v,
                      ),
                      child: Text(
                        "lbl52".tr,
                        style:
                            CustomTextStyles.titleMediumOnPrimaryContainerBold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.h),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "lbl_500egp".tr,
                              style:
                                  CustomTextStyles.titleSmallOnPrimaryContainer,
                            ),
                          ),
                          Text(
                            "msg25".tr,
                            style: CustomTextStyles
                                .labelSmallOnPrimaryContainerMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 52.v,
              width: 63.h,
              margin: EdgeInsets.only(
                left: 8.h,
                bottom: 25.v,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 9.h,
                vertical: 2.v,
              ),
              decoration: AppDecoration.outlineBlack9005.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.img66x60,
                height: 48.v,
                width: 44.h,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowYesConfirm(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 60.v,
        text: "lbl59".tr,
        margin: EdgeInsets.only(right: 9.h),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.titleLargeOnPrimaryContainer,
      ),
    );
  }

  /// Section Widget
  Widget _buildRowCancel(BuildContext context) {
    return Expanded(
      child: CustomOutlinedButton(
        height: 60.v,
        text: "lbl40".tr,
        margin: EdgeInsets.only(left: 9.h),
        buttonTextStyle: CustomTextStyles.titleLargePrimary_1,
      ),
    );
  }

  /// Section Widget
  Widget _buildTen(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGroup40890,
            height: 31.v,
            width: 108.h,
          ),
          SizedBox(height: 15.v),
          CustomImageView(
            imagePath: ImageConstant.img66x60,
            height: 218.v,
            width: 200.h,
          ),
          SizedBox(height: 16.v),
          SizedBox(
            width: 274.h,
            child: Text(
              "msg34".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleLargeBold,
            ),
          ),
          SizedBox(height: 14.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRowYesConfirm(context),
              _buildRowCancel(context),
            ],
          ),
          SizedBox(height: 24.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowView1(BuildContext context) {
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

  /// Common widget
  Widget _buildWidget(
    BuildContext context, {
    required String messageText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.img66x60,
          height: 66.v,
          width: 60.h,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 3.v,
            bottom: 32.v,
          ),
          child: Text(
            messageText,
            style: theme.textTheme.titleMedium!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
      ],
    );
  }
}
