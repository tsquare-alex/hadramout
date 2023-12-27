import '../set_a_date_to_send_the_food_screen/widgets/k0_item_widget.dart';
import 'bloc/set_a_date_to_send_the_food_bloc.dart';
import 'models/k0_item_model.dart';
import 'models/set_a_date_to_send_the_food_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/custom_checkbox_button.dart';
import 'package:hadrmouthamza/widgets/custom_icon_button.dart';

class SetADateToSendTheFoodScreen extends StatelessWidget {
  const SetADateToSendTheFoodScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SetADateToSendTheFoodBloc>(
      create: (context) => SetADateToSendTheFoodBloc(SetADateToSendTheFoodState(
        setADateToSendTheFoodModelObj: SetADateToSendTheFoodModel(),
      ))
        ..add(SetADateToSendTheFoodInitialEvent()),
      child: SetADateToSendTheFoodScreen(),
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
                    alignment: Alignment.bottomCenter,
                    children: [
                      _buildPlaylist(context),
                      _buildClientTestimonials(context),
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
                              _buildReviews(context),
                            ],
                          ),
                        ),
                      ),
                      _buildDoctorReviews(context),
                    ],
                  ),
                ),
                SizedBox(height: 53.v),
                _buildUserProfile(context),
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
  Widget _buildPlaylist(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.h,
          top: 38.v,
          right: 16.h,
        ),
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
            Container(
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
            ),
            SizedBox(height: 20.v),
            Container(
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
                                decoration:
                                    AppDecoration.outlinePrimary1.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder10,
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
            ),
            SizedBox(height: 20.v),
            Container(
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
                                style: CustomTextStyles
                                    .labelSmallOnPrimaryContainer,
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
                    child: BlocSelector<SetADateToSendTheFoodBloc,
                        SetADateToSendTheFoodState, bool?>(
                      selector: (state) => state.tf,
                      builder: (context, tf) {
                        return CustomCheckboxButton(
                          alignment: Alignment.centerRight,
                          width: 148.h,
                          text: "msg_100".tr,
                          value: tf,
                          textStyle: theme.textTheme.labelLarge,
                          isRightCheck: true,
                          onChange: (value) {
                            context
                                .read<SetADateToSendTheFoodBloc>()
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
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildClientTestimonials(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: 16.h,
          right: 16.h,
          bottom: 34.v,
        ),
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
      ),
    );
  }

  /// Section Widget
  Widget _buildReviews(BuildContext context) {
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
          SizedBox(height: 180.v),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "lbl63".tr,
              style: theme.textTheme.titleLarge,
            ),
          ),
          SizedBox(height: 13.v),
          _buildRecentOrders(
            context,
            contrastImage: ImageConstant.imgCheckmarkPrimary16x16,
            timeText: "lbl_12_30pm".tr,
          ),
          SizedBox(height: 16.v),
          _buildRecentOrders(
            context,
            contrastImage: ImageConstant.imgContrastGray20001,
            timeText: "lbl_12_30pm".tr,
          ),
          SizedBox(height: 20.v),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 10.v,
            ),
            decoration: AppDecoration.fillPrimary1.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 75.h,
                  margin: EdgeInsets.symmetric(vertical: 5.v),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        padding: EdgeInsets.all(11.h),
                        decoration:
                            IconButtonStyleHelper.fillOnPrimaryContainerTL15,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgGroup40898,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.v),
                        child: Text(
                          "lbl62".tr,
                          style: CustomTextStyles.titleSmallOnPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 50,
                ),
                SizedBox(
                  height: 41.v,
                  child: VerticalDivider(
                    width: 1.h,
                    thickness: 1.v,
                    color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                  ),
                ),
                Spacer(
                  flex: 49,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.v,
                    bottom: 3.v,
                  ),
                  child: Text(
                    "msg_12_30pm".tr,
                    style: CustomTextStyles.titleSmallOnPrimaryContainer,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgClock,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  margin: EdgeInsets.only(
                    left: 8.h,
                    top: 12.v,
                    bottom: 12.v,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDoctorReviews(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 185.v),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 124.v,
              child: BlocSelector<SetADateToSendTheFoodBloc,
                  SetADateToSendTheFoodState, SetADateToSendTheFoodModel?>(
                selector: (state) => state.setADateToSendTheFoodModelObj,
                builder: (context, setADateToSendTheFoodModelObj) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return SizedBox(
                        width: 1.h,
                      );
                    },
                    itemCount:
                        setADateToSendTheFoodModelObj?.k0ItemList.length ?? 0,
                    itemBuilder: (context, index) {
                      K0ItemModel model =
                          setADateToSendTheFoodModelObj?.k0ItemList[index] ??
                              K0ItemModel();
                      return K0ItemWidget(
                        model,
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(
                  left: 89.h,
                  right: 15.h,
                ),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
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
                            imagePath:
                                ImageConstant.imgVectorOnprimarycontainer4x6,
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
                        Padding(
                          padding: EdgeInsets.only(
                            left: 201.h,
                            top: 4.v,
                          ),
                          child: Text(
                            "lbl30".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
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
  Widget _buildRecentOrders(
    BuildContext context, {
    required String contrastImage,
    required String timeText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: contrastImage,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.only(
            top: 2.v,
            bottom: 3.v,
          ),
        ),
        Text(
          timeText,
          style: CustomTextStyles.titleMediumMedium.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }
}
