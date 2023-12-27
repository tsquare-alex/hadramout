import 'bloc/your_details_bloc.dart';
import 'models/your_details_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/custom_checkbox_button.dart';
import 'package:hadrmouthamza/widgets/custom_elevated_button.dart';
import 'package:hadrmouthamza/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class YourDetailsPage extends StatefulWidget {
  const YourDetailsPage({Key? key})
      : super(
          key: key,
        );

  @override
  YourDetailsPageState createState() => YourDetailsPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<YourDetailsBloc>(
      create: (context) => YourDetailsBloc(YourDetailsState(
        yourDetailsModelObj: YourDetailsModel(),
      ))
        ..add(YourDetailsInitialEvent()),
      child: YourDetailsPage(),
    );
  }
}

class YourDetailsPageState extends State<YourDetailsPage>
    with AutomaticKeepAliveClientMixin<YourDetailsPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 19.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    children: [
                      Text(
                        "lbl66".tr,
                        style: CustomTextStyles.labelLargeBlack900SemiBold,
                      ),
                      SizedBox(height: 42.v),
                      BlocSelector<YourDetailsBloc, YourDetailsState,
                          TextEditingController?>(
                        selector: (state) => state.editTextController,
                        builder: (context, editTextController) {
                          return CustomTextFormField(
                            controller: editTextController,
                            hintText: "lbl67".tr,
                            textInputAction: TextInputAction.done,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 1.h),
                            borderDecoration:
                                TextFormFieldStyleHelper.underLineBlack,
                            filled: false,
                          );
                        },
                      ),
                      SizedBox(height: 27.v),
                      _buildColumnWithTextAndEditText(context),
                      SizedBox(height: 26.v),
                      _buildRowWithTextAndEditText(
                        context,
                        dynamicText: "lbl_202".tr,
                        dynamicText1: "msg40".tr,
                      ),
                      SizedBox(height: 1.v),
                      Divider(
                        color: appTheme.black900.withOpacity(0.1),
                      ),
                      SizedBox(height: 31.v),
                      _buildRowWithTextAndCheckBox(context),
                      SizedBox(height: 30.v),
                      CustomElevatedButton(
                        text: "lbl69".tr,
                      ),
                      SizedBox(height: 418.v),
                      _buildRowWithViewAndImage(context),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnWithTextAndEditText(BuildContext context) {
    return Column(
      children: [
        _buildRowWithTextAndEditText(
          context,
          dynamicText: "lbl_202".tr,
          dynamicText1: "msg39".tr,
        ),
        SizedBox(height: 2.v),
        Divider(
          color: appTheme.black900.withOpacity(0.1),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildRowWithTextAndCheckBox(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "msg41".tr,
          style: CustomTextStyles.labelLargeBlack900_3,
        ),
        BlocSelector<YourDetailsBloc, YourDetailsState, bool?>(
          selector: (state) => state.login,
          builder: (context, login) {
            return CustomCheckboxButton(
              width: 93.h,
              text: "lbl68".tr,
              isExpandedText: true,
              value: login,
              textStyle: CustomTextStyles.labelLargeBlack900_3,
              isRightCheck: true,
              onChange: (value) {
                context
                    .read<YourDetailsBloc>()
                    .add(ChangeCheckBoxEvent(value: value));
              },
            );
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildRowWithViewAndImage(BuildContext context) {
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

  /// Common widget
  Widget _buildRowWithTextAndEditText(
    BuildContext context, {
    required String dynamicText,
    required String dynamicText1,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.v),
          child: Text(
            dynamicText,
            style: CustomTextStyles.bodySmallBlack900_2.copyWith(
              color: appTheme.black900.withOpacity(0.25),
            ),
          ),
        ),
        Container(
          width: 110.h,
          margin: EdgeInsets.only(left: 267.h),
          child: Text(
            dynamicText1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.titleMediumBlack900.copyWith(
              color: appTheme.black900.withOpacity(0.25),
            ),
          ),
        ),
      ],
    );
  }
}
