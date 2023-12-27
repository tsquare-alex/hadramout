import '../home_bage_screen/widgets/orderdetails_item_widget.dart';
import '../home_bage_screen/widgets/settingslist_item_widget.dart';
import '../home_bage_screen/widgets/userprofile_item_widget.dart';
import 'bloc/home_bage_bloc.dart';
import 'models/home_bage_model.dart';
import 'models/orderdetails_item_model.dart';
import 'models/settingslist_item_model.dart';
import 'models/userprofile_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_title_searchview.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hadrmouthamza/widgets/app_bar/custom_app_bar.dart';
import 'package:hadrmouthamza/widgets/custom_icon_button.dart';
import 'package:hadrmouthamza/widgets/custom_outlined_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBageScreen extends StatelessWidget {
  const HomeBageScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBageBloc>(
      create: (context) => HomeBageBloc(HomeBageState(
        homeBageModelObj: HomeBageModel(),
      ))
        ..add(HomeBageInitialEvent()),
      child: HomeBageScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 13.v),
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: Column(
                children: [
                  _buildSettingsList(context),
                  SizedBox(height: 14.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.h),
                      child: Text(
                        "lbl5".tr,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildUserProfile(context),
                  SizedBox(height: 12.v),
                  BlocBuilder<HomeBageBloc, HomeBageState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 8.v,
                        child: AnimatedSmoothIndicator(
                          activeIndex: state.sliderIndex,
                          count: state.homeBageModelObj?.userprofileItemList
                                  .length ??
                              0,
                          axisDirection: Axis.horizontal,
                          effect: ScrollingDotsEffect(
                            spacing: 4,
                            activeDotColor: theme.colorScheme.primary,
                            dotColor: appTheme.gray50033,
                            dotHeight: 8.v,
                            dotWidth: 8.h,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 13.v),
                  _buildArrowDownColumn(context),
                  SizedBox(height: 10.v),
                  _buildAddToCartRow(context),
                  SizedBox(height: 17.v),
                  _buildOrderButtonColumn(context),
                  SizedBox(height: 20.v),
                  _buildStack(context),
                  SizedBox(height: 20.v),
                  _buildRow5(context),
                  SizedBox(height: 16.v),
                  _buildLineFiftyOneStack(context),
                  SizedBox(height: 2.v),
                  Text(
                    "msg8".tr,
                    style: CustomTextStyles.labelLargeBlack900_3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgVector,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 5.v,
          bottom: 5.v,
        ),
      ),
      title: BlocSelector<HomeBageBloc, HomeBageState, TextEditingController?>(
        selector: (state) => state.searchController,
        builder: (context, searchController) {
          return AppbarTitleSearchview(
            margin: EdgeInsets.only(left: 10.h),
            hintText: "lbl".tr,
            controller: searchController,
          );
        },
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgFrame,
          margin: EdgeInsets.fromLTRB(10.h, 21.v, 16.h, 21.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSettingsList(BuildContext context) {
    return SizedBox(
      height: 103.v,
      child: BlocSelector<HomeBageBloc, HomeBageState, HomeBageModel?>(
        selector: (state) => state.homeBageModelObj,
        builder: (context, homeBageModelObj) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 27.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 80.h,
              );
            },
            itemCount: homeBageModelObj?.settingslistItemList.length ?? 0,
            itemBuilder: (context, index) {
              SettingslistItemModel model =
                  homeBageModelObj?.settingslistItemList[index] ??
                      SettingslistItemModel();
              return SettingslistItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h),
      child: BlocBuilder<HomeBageBloc, HomeBageState>(
        builder: (context, state) {
          return CarouselSlider.builder(
            options: CarouselOptions(
              height: 186.v,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (
                index,
                reason,
              ) {
                state.sliderIndex = index;
              },
            ),
            itemCount: state.homeBageModelObj?.userprofileItemList.length ?? 0,
            itemBuilder: (context, index, realIndex) {
              UserprofileItemModel model =
                  state.homeBageModelObj?.userprofileItemList[index] ??
                      UserprofileItemModel();
              return UserprofileItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildArrowDownColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 2.v,
                    bottom: 4.v,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowDown,
                        height: 8.v,
                        width: 10.h,
                        margin: EdgeInsets.only(
                          top: 6.v,
                          bottom: 8.v,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text(
                          "lbl10".tr,
                          style: CustomTextStyles.labelLargePrimarySemiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "lbl11".tr,
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.v),
        Padding(
          padding: EdgeInsets.only(right: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 93.v,
                    width: 96.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.h,
                      vertical: 4.v,
                    ),
                    decoration: AppDecoration.outlineBlack.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.img83x77,
                      height: 83.v,
                      width: 77.h,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Text(
                    "msg2".tr,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelLarge,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: _buildFrameColumn(
                  context,
                  labelText: "lbl12".tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.h),
                child: _buildFrameColumn(
                  context,
                  labelText: "lbl13".tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.h),
                child: _buildFrameColumn(
                  context,
                  labelText: "lbl5".tr,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTf(BuildContext context) {
    return CustomOutlinedButton(
      width: 132.h,
      text: "lbl16".tr,
      rightIcon: Container(
        margin: EdgeInsets.only(left: 12.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgClose,
          height: 13.adaptSize,
          width: 13.adaptSize,
        ),
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  /// Section Widget
  Widget _buildAddToCartColumn(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 12.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: _buildOrderDetailsRow(
                context,
                labelText: "lbl10".tr,
                titleText: "lbl17".tr,
              ),
            ),
            SizedBox(height: 7.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 302.v,
                  width: 194.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 19.v),
                        child: _buildTwentyThreeColumn(
                          context,
                          widget: "lbl14".tr,
                          twelve: "msg_1_2".tr,
                          widget1: "lbl15".tr,
                          price: "lbl_egp_850".tr,
                          price1: "lbl_egp_750".tr,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.img83x77,
                        height: 118.v,
                        width: 110.h,
                        alignment: Alignment.topCenter,
                      ),
                      CustomOutlinedButton(
                        width: 132.h,
                        text: "lbl16".tr,
                        rightIcon: Container(
                          margin: EdgeInsets.only(left: 12.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgClose,
                            height: 13.adaptSize,
                            width: 13.adaptSize,
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 69.v,
                          width: 100.h,
                          margin: EdgeInsets.only(top: 50.v),
                          decoration: BoxDecoration(
                            color: appTheme.black900.withOpacity(0.02),
                            borderRadius: BorderRadius.circular(
                              50.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 302.v,
                  width: 194.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 19.v),
                        child: _buildTwentyThreeColumn(
                          context,
                          widget: "lbl14".tr,
                          twelve: "msg_1_2".tr,
                          widget1: "lbl15".tr,
                          price: "lbl_egp_850".tr,
                          price1: "lbl_egp_750".tr,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.img83x77,
                        height: 118.v,
                        width: 110.h,
                        alignment: Alignment.topCenter,
                      ),
                      CustomOutlinedButton(
                        width: 132.h,
                        text: "lbl16".tr,
                        rightIcon: Container(
                          margin: EdgeInsets.only(left: 12.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgClose,
                            height: 13.adaptSize,
                            width: 13.adaptSize,
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 69.v,
                          width: 100.h,
                          margin: EdgeInsets.only(top: 50.v),
                          decoration: BoxDecoration(
                            color: appTheme.black900.withOpacity(0.02),
                            borderRadius: BorderRadius.circular(
                              50.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAddToCartRow(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: Row(
          children: [
            Container(
              height: 302.v,
              width: 194.h,
              margin: EdgeInsets.only(top: 37.v),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 19.v),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.h,
                        vertical: 40.v,
                      ),
                      decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 40.v),
                          _buildRow(
                            context,
                            widgetText: "lbl14".tr,
                          ),
                          SizedBox(height: 1.v),
                          SizedBox(
                            width: 178.h,
                            child: Divider(),
                          ),
                          SizedBox(height: 3.v),
                          SizedBox(
                            width: 178.h,
                            child: Text(
                              "msg_1_2".tr,
                              maxLines: null,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: CustomTextStyles.labelSmallMedium,
                            ),
                          ),
                          SizedBox(height: 6.v),
                          _buildRow1(
                            context,
                            widgetText: "lbl15".tr,
                            priceText1: "lbl_egp_850".tr,
                            priceText2: "lbl_egp_750".tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.img83x77,
                    height: 118.v,
                    width: 110.h,
                    alignment: Alignment.topCenter,
                  ),
                  _buildTf(context),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 69.v,
                      width: 100.h,
                      margin: EdgeInsets.only(top: 50.v),
                      decoration: BoxDecoration(
                        color: appTheme.black900.withOpacity(0.02),
                        borderRadius: BorderRadius.circular(
                          50.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildAddToCartColumn(context),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildOrderButtonColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: _buildOrderDetailsRow(
            context,
            labelText: "lbl10".tr,
            titleText: "lbl18".tr,
          ),
        ),
        SizedBox(height: 10.v),
        SizedBox(
          height: 137.v,
          child: BlocSelector<HomeBageBloc, HomeBageState, HomeBageModel?>(
            selector: (state) => state.homeBageModelObj,
            builder: (context, homeBageModelObj) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (
                  context,
                  index,
                ) {
                  return SizedBox(
                    width: 229.0.h,
                    child: Divider(
                      height: 1.v,
                      thickness: 1.v,
                      color: appTheme.black900.withOpacity(0.05),
                      indent: 6.0.h,
                      endIndent: 6.0.h,
                    ),
                  );
                },
                itemCount: homeBageModelObj?.orderdetailsItemList.length ?? 0,
                itemBuilder: (context, index) {
                  OrderdetailsItemModel model =
                      homeBageModelObj?.orderdetailsItemList[index] ??
                          OrderdetailsItemModel();
                  return OrderdetailsItemWidget(
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
  Widget _buildTf1(BuildContext context) {
    return CustomOutlinedButton(
      width: 99.h,
      text: "lbl9".tr,
      leftIcon: Container(
        margin: EdgeInsets.only(right: 12.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgArrowdownOnprimarycontainer,
          height: 12.v,
          width: 14.h,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineOnPrimaryContainer,
      buttonTextStyle: CustomTextStyles.labelLargeOnPrimaryContainer,
      alignment: Alignment.centerRight,
    );
  }

  /// Section Widget
  Widget _buildStack(BuildContext context) {
    return SizedBox(
      height: 193.v,
      width: 409.h,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 193.v,
              width: 398.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgImage3,
                    height: 193.v,
                    width: 398.h,
                    radius: BorderRadius.circular(
                      10.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      decoration: AppDecoration.gradientBlackToBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgTelevision,
                            height: 16.v,
                            width: 72.h,
                          ),
                          SizedBox(height: 8.v),
                          Text(
                            "lbl21".tr,
                            style: CustomTextStyles
                                .headlineSmallOnPrimaryContainer,
                          ),
                          SizedBox(height: 1.v),
                          Column(
                            children: [
                              Text(
                                "msg3".tr,
                                style: CustomTextStyles
                                    .titleMediumOnPrimaryContainerMedium,
                              ),
                              SizedBox(height: 10.v),
                              _buildTf1(context),
                            ],
                          ),
                          SizedBox(height: 43.v),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 177.v,
              width: 174.h,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.img120R50x45,
                    height: 50.v,
                    width: 45.h,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(bottom: 10.v),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.img120R50x45,
                    height: 49.v,
                    width: 44.h,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(bottom: 49.v),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.img120R50x45,
                    height: 49.v,
                    width: 44.h,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(
                      right: 21.h,
                      bottom: 16.v,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.img120R50x45,
                    height: 49.v,
                    width: 44.h,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(
                      right: 6.h,
                      bottom: 30.v,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgRemovebgPreview31x20,
                    height: 31.v,
                    width: 20.h,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      left: 54.h,
                      top: 66.v,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgRemovebgPreview31x20,
                    height: 47.v,
                    width: 30.h,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(
                      top: 58.v,
                      right: 61.h,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.img120R50x45,
                    height: 49.v,
                    width: 44.h,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(
                      top: 55.v,
                      right: 9.h,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgRemovebgPreview31x20,
                    height: 45.v,
                    width: 29.h,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      left: 46.h,
                      top: 56.v,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgRemovebgPreview31x20,
                    height: 45.v,
                    width: 29.h,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      left: 65.h,
                      top: 56.v,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgRemovebgPreview31x20,
                    height: 47.v,
                    width: 30.h,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(
                      top: 58.v,
                      right: 41.h,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgRemovebgPreview136x96,
                    height: 136.v,
                    width: 96.h,
                    alignment: Alignment.topLeft,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.img61x77,
                    height: 61.v,
                    width: 77.h,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(
                      right: 10.h,
                      bottom: 47.v,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.img61x77,
                    height: 60.v,
                    width: 117.h,
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(
                      left: 17.h,
                      bottom: 47.v,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.img61x77,
                    height: 61.v,
                    width: 77.h,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(
                      right: 30.h,
                      bottom: 7.v,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.img61x77,
                    height: 60.v,
                    width: 115.h,
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(left: 17.h),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAddToCartButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 99.h,
      text: "lbl9".tr,
      leftIcon: Container(
        margin: EdgeInsets.only(right: 12.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgArrowdownOnprimary,
          height: 12.v,
          width: 14.h,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineOnPrimary,
      buttonTextStyle: CustomTextStyles.labelLargeOnPrimary,
      alignment: Alignment.centerRight,
    );
  }

  /// Section Widget
  Widget _buildRow5(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.outlineBlack9002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 132.v,
            width: 210.h,
            margin: EdgeInsets.only(left: 6.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60.adaptSize,
                    width: 60.adaptSize,
                    padding: EdgeInsets.all(2.h),
                    decoration: AppDecoration.outlinePrimary.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder30,
                    ),
                    child: CustomIconButton(
                      height: 51.adaptSize,
                      width: 51.adaptSize,
                      padding: EdgeInsets.all(3.h),
                      decoration: IconButtonStyleHelper.fillPrimary,
                      alignment: Alignment.center,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgSettingsGray100,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 42.h,
                    margin: EdgeInsets.only(top: 31.v),
                    child: Text(
                      "msg4".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.labelSmallBlack900,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgLine49,
                  height: 30.v,
                  width: 38.h,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(
                    right: 40.h,
                    bottom: 45.v,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgLine50,
                  height: 30.v,
                  width: 37.h,
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(
                    left: 41.h,
                    bottom: 45.v,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60.adaptSize,
                        width: 60.adaptSize,
                        padding: EdgeInsets.all(2.h),
                        decoration: AppDecoration.outlinePrimary.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder30,
                        ),
                        child: CustomIconButton(
                          height: 51.adaptSize,
                          width: 51.adaptSize,
                          padding: EdgeInsets.all(6.h),
                          decoration: IconButtonStyleHelper.fillPrimary,
                          alignment: Alignment.center,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgGroup40846,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.v),
                      SizedBox(
                        height: 41.v,
                        width: 65.h,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                width: 56.h,
                                child: Text(
                                  "msg5".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles.labelSmallBlack900,
                                ),
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgPolygon3,
                              height: 14.adaptSize,
                              width: 14.adaptSize,
                              alignment: Alignment.topRight,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 60.adaptSize,
                          width: 60.adaptSize,
                          padding: EdgeInsets.all(2.h),
                          decoration: AppDecoration.outlinePrimary.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder30,
                          ),
                          child: CustomIconButton(
                            height: 51.adaptSize,
                            width: 51.adaptSize,
                            padding: EdgeInsets.all(6.h),
                            decoration: IconButtonStyleHelper.fillPrimary,
                            alignment: Alignment.center,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgThumbsUp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgPolygon2,
                            height: 13.adaptSize,
                            width: 13.adaptSize,
                            margin: EdgeInsets.only(bottom: 26.v),
                          ),
                          Container(
                            width: 29.h,
                            margin: EdgeInsets.only(
                              left: 6.h,
                              top: 8.v,
                            ),
                            child: Text(
                              "lbl22".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.labelSmallBlack900,
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
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 3.v,
              bottom: 17.v,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      "msg6".tr,
                      style: CustomTextStyles.titleMediumOnPrimary,
                    ),
                    SizedBox(height: 1.v),
                    SizedBox(
                      width: 138.h,
                      child: Text(
                        "msg7".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: theme.textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 9.v),
                _buildAddToCartButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLineFiftyOneStack(BuildContext context) {
    return SizedBox(
      height: 91.v,
      width: 400.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 400.h,
              child: Divider(),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.img91x177,
            height: 91.v,
            width: 177.h,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrameColumn(
    BuildContext context, {
    required String labelText,
  }) {
    return Column(
      children: [
        Container(
          height: 93.v,
          width: 96.h,
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 4.v,
          ),
          decoration: AppDecoration.outlineBlack.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.img83x77,
            height: 83.v,
            width: 77.h,
            alignment: Alignment.center,
          ),
        ),
        SizedBox(height: 5.v),
        Text(
          labelText,
          style: theme.textTheme.labelLarge!.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildRow(
    BuildContext context, {
    required String widgetText,
  }) {
    return SizedBox(
      width: 178.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgFavorite,
            height: 13.v,
            width: 16.h,
            margin: EdgeInsets.only(
              top: 3.v,
              bottom: 5.v,
            ),
          ),
          Text(
            widgetText,
            style: CustomTextStyles.labelLargeSemiBold.copyWith(
              color: appTheme.black900,
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildRow1(
    BuildContext context, {
    required String widgetText,
    required String priceText1,
    required String priceText2,
  }) {
    return Container(
      width: 178.h,
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 3.v,
      ),
      decoration: AppDecoration.fillOnPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 56.h,
            margin: EdgeInsets.symmetric(vertical: 2.v),
            padding: EdgeInsets.symmetric(vertical: 5.v),
            decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 14.v,
                  width: 16.h,
                  margin: EdgeInsets.symmetric(vertical: 1.v),
                  padding: EdgeInsets.all(4.h),
                  decoration: AppDecoration.fillOnPrimary1.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgVectorOnprimarycontainer,
                    height: 5.v,
                    width: 6.h,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    widgetText,
                    style: CustomTextStyles.labelSmallOnPrimary.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32.v,
            width: 44.h,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    priceText1,
                    style: theme.textTheme.labelSmall!.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: appTheme.black900.withOpacity(0.5),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    priceText2,
                    style: CustomTextStyles.labelLargeSemiBold.copyWith(
                      color: appTheme.black900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildTwentyThreeColumn(
    BuildContext context, {
    required String widget,
    required String twelve,
    required String widget1,
    required String price,
    required String price1,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 40.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 40.v),
          Column(
            children: [
              SizedBox(
                width: 178.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgFavorite,
                      height: 13.v,
                      width: 16.h,
                      margin: EdgeInsets.only(
                        top: 3.v,
                        bottom: 5.v,
                      ),
                    ),
                    Text(
                      widget,
                      style: CustomTextStyles.labelLargeSemiBold.copyWith(
                        color: appTheme.black900,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 178.h,
                child: Divider(),
              ),
            ],
          ),
          SizedBox(height: 4.v),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 147.h,
              child: Text(
                twelve,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: CustomTextStyles.labelSmallMedium.copyWith(
                  color: appTheme.black900.withOpacity(0.5),
                ),
              ),
            ),
          ),
          SizedBox(height: 4.v),
          Container(
            width: 178.h,
            padding: EdgeInsets.symmetric(
              horizontal: 8.h,
              vertical: 3.v,
            ),
            decoration: AppDecoration.fillOnPrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 56.h,
                  margin: EdgeInsets.symmetric(vertical: 2.v),
                  padding: EdgeInsets.symmetric(vertical: 5.v),
                  decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 14.v,
                        width: 16.h,
                        margin: EdgeInsets.symmetric(vertical: 1.v),
                        padding: EdgeInsets.all(4.h),
                        decoration: AppDecoration.fillOnPrimary1.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgVectorOnprimarycontainer,
                          height: 5.v,
                          width: 6.h,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.v),
                        child: Text(
                          widget1,
                          style: CustomTextStyles.labelSmallOnPrimary.copyWith(
                            color: theme.colorScheme.onPrimary.withOpacity(1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.v,
                  width: 44.h,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          price,
                          style: theme.textTheme.labelSmall!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: appTheme.black900.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          price1,
                          style: CustomTextStyles.labelLargeSemiBold.copyWith(
                            color: appTheme.black900,
                          ),
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

  /// Common widget
  Widget _buildOrderDetailsRow(
    BuildContext context, {
    required String labelText,
    required String titleText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgArrowDown,
          height: 8.v,
          width: 10.h,
          margin: EdgeInsets.only(
            top: 9.v,
            bottom: 11.v,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 8.h,
            top: 3.v,
            bottom: 3.v,
          ),
          child: Text(
            labelText,
            style: CustomTextStyles.labelLargePrimarySemiBold.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        Spacer(),
        Text(
          titleText,
          style: theme.textTheme.titleMedium!.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }
}
