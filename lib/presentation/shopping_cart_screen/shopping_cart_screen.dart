import '../shopping_cart_screen/widgets/productcard_item_widget.dart';
import '../shopping_cart_screen/widgets/userprofilelist_item_widget.dart';
import 'bloc/shopping_cart_bloc.dart';
import 'models/productcard_item_model.dart';
import 'models/shopping_cart_model.dart';
import 'models/userprofilelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_subtitle.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_title_button.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hadrmouthamza/widgets/app_bar/custom_app_bar.dart';
import 'package:hadrmouthamza/widgets/custom_icon_button.dart';
import 'package:hadrmouthamza/widgets/custom_outlined_button.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ShoppingCartBloc>(
      create: (context) => ShoppingCartBloc(ShoppingCartState(
        shoppingCartModelObj: ShoppingCartModel(),
      ))
        ..add(ShoppingCartInitialEvent()),
      child: ShoppingCartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 28.v),
          child: Column(
            children: [
              SizedBox(height: 7.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.v),
                    child: Column(
                      children: [
                        _buildUserProfileList(context),
                        SizedBox(height: 16.v),
                        _buildFrameColumn(context),
                        SizedBox(height: 16.v),
                        _buildKetchupList(context),
                        SizedBox(height: 16.v),
                        _buildArrowDown(context),
                        SizedBox(height: 19.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: _buildFrameRow(
                            context,
                            priceText: "lbl_500egp".tr,
                            widgetText: "lbl49".tr,
                          ),
                        ),
                        SizedBox(height: 7.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: _buildFrameRow(
                            context,
                            priceText: "lbl_25egp".tr,
                            widgetText: "lbl50".tr,
                          ),
                        ),
                        SizedBox(height: 8.v),
                        Divider(
                          indent: 16.h,
                          endIndent: 16.h,
                        ),
                        SizedBox(height: 11.v),
                        _buildFrameRow2(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildArrowLeftRow(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 16.h),
        child: Row(
          children: [
            AppbarTitleButton(),
            AppbarSubtitleOne(
              text: "msg_32".tr,
              margin: EdgeInsets.only(
                left: 100.h,
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
            top: 9.v,
            right: 8.h,
          ),
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.fromLTRB(16.h, 18.v, 24.h, 15.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildUserProfileList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child:
          BlocSelector<ShoppingCartBloc, ShoppingCartState, ShoppingCartModel?>(
        selector: (state) => state.shoppingCartModelObj,
        builder: (context, shoppingCartModelObj) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 16.v,
              );
            },
            itemCount:
                shoppingCartModelObj?.userprofilelistItemList.length ?? 0,
            itemBuilder: (context, index) {
              UserprofilelistItemModel model =
                  shoppingCartModelObj?.userprofilelistItemList[index] ??
                      UserprofilelistItemModel();
              return UserprofilelistItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameColumn(BuildContext context) {
    return Container(
      width: 398.h,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
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
  Widget _buildTf(BuildContext context) {
    return Expanded(
      child: CustomOutlinedButton(
        text: "lbl29".tr,
        margin: EdgeInsets.only(right: 8.h),
        buttonTextStyle: CustomTextStyles.bodySmallPrimary,
      ),
    );
  }

  /// Section Widget
  Widget _buildTf1(BuildContext context) {
    return Expanded(
      child: CustomOutlinedButton(
        text: "msg13".tr,
        margin: EdgeInsets.only(left: 8.h),
        buttonTextStyle: CustomTextStyles.bodySmallPrimary,
      ),
    );
  }

  /// Section Widget
  Widget _buildKetchupList(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: AppDecoration.outlineBlack9002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 19.h,
                top: 11.v,
                bottom: 11.v,
              ),
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
                      _buildTf(context),
                      _buildTf1(context),
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
  Widget _buildArrowDown(BuildContext context) {
    return SizedBox(
      height: 301.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(16.h, 145.v, 16.h, 86.v),
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 7.v,
              ),
              decoration: AppDecoration.outlineBlack9002.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowDownBlack900,
                    height: 12.v,
                    width: 14.h,
                    margin: EdgeInsets.only(
                      left: 2.h,
                      top: 22.v,
                      bottom: 21.v,
                    ),
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "lbl44".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(height: 4.v),
                      Text(
                        "msg23".tr,
                        style: CustomTextStyles.bodySmallBlack900,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgTelevisionPrimary19x24,
                    height: 19.v,
                    width: 24.h,
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 17.h),
                  ),
                  SizedBox(height: 94.v),
                  Container(
                    decoration: AppDecoration.outlineBlack9002.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 22.v,
                              bottom: 17.v,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgArrowDownBlack900,
                                  height: 12.v,
                                  width: 14.h,
                                  margin: EdgeInsets.only(
                                    top: 6.v,
                                    bottom: 11.v,
                                  ),
                                ),
                                Text(
                                  "lbl45".tr,
                                  style: theme.textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 69.v,
                          width: 7.h,
                          margin: EdgeInsets.only(
                            left: 42.h,
                            bottom: 1.v,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(5.h),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
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
                  child: BlocSelector<ShoppingCartBloc, ShoppingCartState,
                      ShoppingCartModel?>(
                    selector: (state) => state.shoppingCartModelObj,
                    builder: (context, shoppingCartModelObj) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (
                          context,
                          index,
                        ) {
                          return SizedBox(
                            width: 82.0.h,
                            child: Divider(
                              height: 1.v,
                              thickness: 1.v,
                              color: appTheme.black900.withOpacity(0.05),
                              indent: 6.0.h,
                              endIndent: 6.0.h,
                            ),
                          );
                        },
                        itemCount:
                            shoppingCartModelObj?.productcardItemList.length ??
                                0,
                        itemBuilder: (context, index) {
                          ProductcardItemModel model = shoppingCartModelObj
                                  ?.productcardItemList[index] ??
                              ProductcardItemModel();
                          return ProductcardItemWidget(
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
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameRow2(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 5.v,
              bottom: 8.v,
            ),
            child: Text(
              "lbl_525egp2".tr,
              style: CustomTextStyles.labelLargeBlack900SemiBold,
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "lbl51".tr,
                  style: CustomTextStyles.labelLargeBlack900SemiBold,
                ),
              ),
              Text(
                "msg24".tr,
                style: CustomTextStyles.labelSmallPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildArrowLeftRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 28.h,
        right: 16.h,
        bottom: 34.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: 4.v,
                bottom: 5.v,
              ),
              decoration: AppDecoration.fillPrimary1.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.v),
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
                      bottom: 3.v,
                    ),
                    child: Text(
                      "lbl52".tr,
                      style: CustomTextStyles.titleMediumOnPrimaryContainerBold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
            margin: EdgeInsets.only(left: 20.h),
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
    );
  }

  /// Common widget
  Widget _buildFrameRow(
    BuildContext context, {
    required String priceText,
    required String widgetText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: Text(
            priceText,
            style: CustomTextStyles.labelLargeBlack900SemiBold.copyWith(
              color: appTheme.black900.withOpacity(0.5),
            ),
          ),
        ),
        Text(
          widgetText,
          style: CustomTextStyles.labelLargeBlack900SemiBold.copyWith(
            color: appTheme.black900.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
