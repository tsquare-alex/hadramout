import '../models/settingslist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';

// ignore: must_be_immutable
class SettingslistItemWidget extends StatelessWidget {
  SettingslistItemWidget(
    this.settingslistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SettingslistItemModel settingslistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75.h,
      child: Column(
        children: [
          CustomImageView(
            imagePath: settingslistItemModelObj?.settingsImage,
            height: 70.adaptSize,
            width: 70.adaptSize,
          ),
          SizedBox(height: 5.v),
          Text(
            settingslistItemModelObj.settingsText!,
            style: CustomTextStyles.titleSmallBlack900,
          ),
        ],
      ),
    );
  }
}
