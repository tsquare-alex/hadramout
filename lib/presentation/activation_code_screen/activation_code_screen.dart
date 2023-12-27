import 'bloc/activation_code_bloc.dart';
import 'models/activation_code_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_subtitle.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hadrmouthamza/widgets/app_bar/custom_app_bar.dart';
import 'package:hadrmouthamza/widgets/custom_elevated_button.dart';
import 'package:hadrmouthamza/widgets/custom_pin_code_text_field.dart';

class ActivationCodeScreen extends StatelessWidget {
  const ActivationCodeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ActivationCodeBloc>(
      create: (context) => ActivationCodeBloc(ActivationCodeState(
        activationCodeModelObj: ActivationCodeModel(),
      ))
        ..add(ActivationCodeInitialEvent()),
      child: ActivationCodeScreen(),
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
            padding: EdgeInsets.only(top: 11.v),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 372.h,
                      margin: EdgeInsets.only(left: 26.h),
                      child: Text(
                        "msg35".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                  SizedBox(height: 34.v),
                  Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: BlocSelector<ActivationCodeBloc, ActivationCodeState,
                        TextEditingController?>(
                      selector: (state) => state.otpController,
                      builder: (context, otpController) {
                        return CustomPinCodeTextField(
                          context: context,
                          controller: otpController,
                          onChanged: (value) {
                            otpController?.text = value;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 28.v),
                  SizedBox(
                    width: 253.h,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "msg37".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                          TextSpan(
                            text: "lbl61".tr,
                            style: CustomTextStyles.titleMediumPrimary_2,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(height: 23.v),
                  SizedBox(
                    width: 278.h,
                    child: Text(
                      "msg38".tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: CustomTextStyles.titleMediumPrimary,
                    ),
                  ),
                  SizedBox(height: 28.v),
                  CustomElevatedButton(
                    text: "lbl62".tr,
                  ),
                  SizedBox(height: 481.v),
                  _buildActivationCodeView(context),
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
          text: "lbl60".tr,
          margin: EdgeInsets.only(
            left: 16.h,
            top: 9.v,
            right: 9.h,
          ),
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.fromLTRB(16.h, 18.v, 25.h, 15.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildActivationCodeView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1.h),
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
    );
  }
}
