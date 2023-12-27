import 'bloc/coupon_code_bloc.dart';
import 'models/coupon_code_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_subtitle.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hadrmouthamza/widgets/app_bar/custom_app_bar.dart';
import 'package:hadrmouthamza/widgets/custom_elevated_button.dart';
import 'package:hadrmouthamza/widgets/custom_text_form_field.dart';

class CouponCodeScreen extends StatelessWidget {
  const CouponCodeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<CouponCodeBloc>(
      create: (context) => CouponCodeBloc(CouponCodeState(
        couponCodeModelObj: CouponCodeModel(),
      ))
        ..add(CouponCodeInitialEvent()),
      child: CouponCodeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 10.v),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Column(
                children: [
                  DottedBorder(
                    color: appTheme.black900.withOpacity(0.1),
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
                      7,
                      7,
                    ],
                    child: BlocSelector<CouponCodeBloc, CouponCodeState,
                        TextEditingController?>(
                      selector: (state) => state.applicationController,
                      builder: (context, applicationController) {
                        return CustomTextFormField(
                          controller: applicationController,
                          hintText: "lbl34".tr,
                          textInputAction: TextInputAction.done,
                          suffix: Padding(
                            padding: EdgeInsets.fromLTRB(30.h, 14.v, 12.h, 8.v),
                            child: Text(
                              "msg15".tr,
                              style: TextStyle(
                                color: Color(0X3F000000),
                                fontSize: 14.fSize,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          suffixConstraints: BoxConstraints(
                            maxHeight: 50.v,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 70.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgFramePrimary,
                    height: 221.v,
                    width: 300.h,
                  ),
                  SizedBox(height: 27.v),
                  Text(
                    "lbl35".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                  SizedBox(height: 13.v),
                  CustomElevatedButton(
                    text: "msg16".tr,
                    margin: EdgeInsets.only(
                      left: 44.h,
                      right: 45.h,
                    ),
                  ),
                  SizedBox(height: 374.v),
                  _buildCouponCodeView(context),
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
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      actions: [
        AppbarSubtitle(
          text: "lbl33".tr,
          margin: EdgeInsets.only(
            left: 16.h,
            top: 9.v,
            right: 8.h,
          ),
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.fromLTRB(16.h, 20.v, 24.h, 13.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildCouponCodeView(BuildContext context) {
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
