import '../models/row_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';

// ignore: must_be_immutable
class RowItemWidget extends StatelessWidget {
  RowItemWidget(
    this.rowItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RowItemModel rowItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 4.v,
      ),
      decoration: AppDecoration.outlineBlack9002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: rowItemModelObj?.imageClass,
            height: 16.adaptSize,
            width: 16.adaptSize,
            margin: EdgeInsets.only(
              top: 20.v,
              bottom: 18.v,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 17.v,
              bottom: 14.v,
            ),
            child: Text(
              rowItemModelObj.text!,
              style: theme.textTheme.labelLarge,
            ),
          ),
          CustomImageView(
            imagePath: rowItemModelObj?.name,
            height: 54.v,
            width: 50.h,
            margin: EdgeInsets.only(
              left: 12.h,
              top: 1.v,
            ),
          ),
        ],
      ),
    );
  }
}
