import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/widgets/custom_outlined_button.dart';

// ignore: must_be_immutable
class AppbarTitleButtonOne extends StatelessWidget {
  AppbarTitleButtonOne({
    Key? key,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomOutlinedButton(
          height: 34.v,
          width: 65.h,
          text: "lbl58".tr,
          buttonStyle: CustomButtonStyles.outlineSecondaryContainer,
        ),
      ),
    );
  }
}
