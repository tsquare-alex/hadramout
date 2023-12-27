import '../meal_details_page/widgets/row_item_widget.dart';
import 'bloc/meal_details_bloc.dart';
import 'models/meal_details_model.dart';
import 'models/row_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/custom_icon_button.dart';
import 'package:hadrmouthamza/widgets/custom_radio_button.dart';

// ignore_for_file: must_be_immutable
class MealDetailsPage extends StatefulWidget {
  const MealDetailsPage({Key? key})
      : super(
          key: key,
        );

  @override
  MealDetailsPageState createState() => MealDetailsPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<MealDetailsBloc>(
      create: (context) => MealDetailsBloc(MealDetailsState(
        mealDetailsModelObj: MealDetailsModel(),
      ))
        ..add(MealDetailsInitialEvent()),
      child: MealDetailsPage(),
    );
  }
}

class MealDetailsPageState extends State<MealDetailsPage>
    with AutomaticKeepAliveClientMixin<MealDetailsPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 18.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    right: 12.h,
                  ),
                  child: Column(
                    children: [
                      _buildSixtyNine(context),
                      SizedBox(height: 17.v),
                      _buildSeventyOne(context),
                      SizedBox(height: 17.v),
                      _buildSeventyFour(context),
                      SizedBox(height: 18.v),
                      _buildSeventy(context),
                      SizedBox(height: 17.v),
                      _buildSeventyTwo(context),
                    ],
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
  Widget _buildSixtyNine(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: Text(
              "msg26".tr,
              style: CustomTextStyles.labelLargeBlack900_1,
            ),
          ),
        ),
        SizedBox(height: 9.v),
        Container(
          margin: EdgeInsets.only(right: 4.h),
          padding: EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 4.v,
          ),
          decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgCheckmarkPrimary16x16,
                height: 16.adaptSize,
                width: 16.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 19.v),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: 16.v,
                  bottom: 15.v,
                ),
                child: Text(
                  "lbl14".tr,
                  style: theme.textTheme.labelLarge,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.img83x77,
                height: 54.v,
                width: 50.h,
                margin: EdgeInsets.only(
                  left: 8.h,
                  bottom: 1.v,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSeventyOne(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: Text(
              "lbl53".tr,
              style: CustomTextStyles.labelLargeBlack900_1,
            ),
          ),
        ),
        SizedBox(height: 9.v),
        Padding(
          padding: EdgeInsets.only(right: 4.h),
          child: BlocSelector<MealDetailsBloc, MealDetailsState,
              MealDetailsModel?>(
            selector: (state) => state.mealDetailsModelObj,
            builder: (context, mealDetailsModelObj) {
              return ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (
                  context,
                  index,
                ) {
                  return SizedBox(
                    height: 12.v,
                  );
                },
                itemCount: mealDetailsModelObj?.rowItemList.length ?? 0,
                itemBuilder: (context, index) {
                  RowItemModel model =
                      mealDetailsModelObj?.rowItemList[index] ?? RowItemModel();
                  return RowItemWidget(
                    model,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSeventyFour(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: Text(
              "msg30".tr,
              style: CustomTextStyles.labelLargeBlack900_1,
            ),
          ),
        ),
        SizedBox(height: 10.v),
        Padding(
          padding: EdgeInsets.only(right: 4.h),
          child: Column(
            children: [
              SizedBox(
                height: 64.v,
                width: 398.h,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: BlocSelector<MealDetailsBloc, MealDetailsState,
                          String?>(
                        selector: (state) => state.radioGroup,
                        builder: (context, radioGroup) {
                          return CustomRadioButton(
                            width: 398.h,
                            text: "lbl32".tr,
                            value: "lbl32".tr,
                            groupValue: radioGroup,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.h,
                              vertical: 18.v,
                            ),
                            isRightCheck: true,
                            onChange: (value) {
                              context
                                  .read<MealDetailsBloc>()
                                  .add(ChangeRadioButtonEvent(value: value));
                            },
                          );
                        },
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgPrimary,
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 12.h),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgCheckmarkOnprimarycontainer,
                      height: 7.v,
                      width: 10.h,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 15.h),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.v),
              _buildContrast(
                context,
                widget: "lbl32".tr,
              ),
              SizedBox(height: 12.v),
              SizedBox(
                height: 64.v,
                width: 398.h,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    _buildContrast(
                      context,
                      widget: "lbl32".tr,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgGroup40660,
                      height: 6.v,
                      width: 10.h,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                        left: 15.h,
                        top: 25.v,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSeventy(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: Text(
              "msg14".tr,
              style: CustomTextStyles.labelLargeBlack900_1,
            ),
          ),
        ),
        SizedBox(height: 9.v),
        Padding(
          padding: EdgeInsets.only(right: 4.h),
          child: Column(
            children: [
              SizedBox(
                height: 64.v,
                width: 398.h,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: BlocSelector<MealDetailsBloc, MealDetailsState,
                          String?>(
                        selector: (state) => state.radioGroup1,
                        builder: (context, radioGroup1) {
                          return CustomRadioButton(
                            width: 398.h,
                            text: "lbl54".tr,
                            value: "lbl54".tr,
                            groupValue: radioGroup1,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.h,
                              vertical: 19.v,
                            ),
                            isRightCheck: true,
                            onChange: (value) {
                              context
                                  .read<MealDetailsBloc>()
                                  .add(ChangeRadioButton1Event(value: value));
                            },
                          );
                        },
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgPrimary,
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 12.h),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgCheckmarkOnprimarycontainer,
                      height: 7.v,
                      width: 10.h,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 15.h),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.v),
              SizedBox(
                height: 64.v,
                width: 398.h,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.h,
                          vertical: 12.v,
                        ),
                        decoration:
                            AppDecoration.fillOnPrimaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgContrastGray200,
                              height: 16.adaptSize,
                              width: 16.adaptSize,
                              margin: EdgeInsets.only(
                                left: 5.h,
                                top: 12.v,
                                bottom: 12.v,
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 9.v,
                                bottom: 7.v,
                              ),
                              child: Text(
                                "lbl54".tr,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgRemovebgpreview7,
                              height: 39.v,
                              width: 54.h,
                              margin: EdgeInsets.only(left: 10.h),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgGroup40660,
                      height: 6.v,
                      width: 10.h,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                        left: 15.h,
                        top: 5.v,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSeventyTwo(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: Text(
              "lbl55".tr,
              style: CustomTextStyles.labelLargeBlack900_1,
            ),
          ),
        ),
        SizedBox(height: 2.v),
        SizedBox(
          height: 80.v,
          width: 402.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgCheckmarkOnprimarycontainer,
                height: 11.v,
                width: 10.h,
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(
                  left: 19.h,
                  bottom: 12.v,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(right: 4.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 70.h,
                    vertical: 19.v,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 2.v),
                      Text(
                        "lbl56".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgPrimary,
                height: 16.adaptSize,
                width: 16.adaptSize,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 12.h),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgCheckmarkOnprimarycontainer,
                height: 7.v,
                width: 10.h,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 15.h),
              ),
              CustomImageView(
                imagePath: ImageConstant.img91x177,
                height: 80.adaptSize,
                width: 80.adaptSize,
                alignment: Alignment.centerRight,
              ),
            ],
          ),
        ),
        SizedBox(height: 14.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.v),
                decoration: AppDecoration.fillPrimary1.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIconButton(
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                      padding: EdgeInsets.all(13.h),
                      decoration:
                          IconButtonStyleHelper.fillOnPrimaryContainerTL20,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgArrowLeftPrimary,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 7.v,
                        bottom: 4.v,
                      ),
                      child: Text(
                        "lbl57".tr,
                        style:
                            CustomTextStyles.titleMediumOnPrimaryContainerBold,
                      ),
                    ),
                    Column(
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
                  ],
                ),
              ),
            ),
            Container(
              height: 52.v,
              width: 63.h,
              margin: EdgeInsets.only(left: 8.h),
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
      ],
    );
  }

  /// Common widget
  Widget _buildContrast(
    BuildContext context, {
    required String widget,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgContrastGray200,
            height: 16.adaptSize,
            width: 16.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 18.v),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 16.v,
              bottom: 12.v,
            ),
            child: Text(
              widget,
              style: theme.textTheme.bodySmall!.copyWith(
                color: appTheme.black900.withOpacity(0.75),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgRemovebgPreview,
            height: 45.v,
            width: 41.h,
            margin: EdgeInsets.only(
              left: 14.h,
              top: 7.v,
              right: 4.h,
            ),
          ),
        ],
      ),
    );
  }
}
