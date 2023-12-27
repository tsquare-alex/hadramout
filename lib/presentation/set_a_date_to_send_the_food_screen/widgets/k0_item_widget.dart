import '../models/k0_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';

// ignore: must_be_immutable
class K0ItemWidget extends StatelessWidget {
  K0ItemWidget(
    this.k0ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  K0ItemModel k0ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.v),
      padding: EdgeInsets.symmetric(
        horizontal: 31.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      width: 110.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            k0ItemModelObj.dynamicText1!,
            textAlign: TextAlign.center,
            style: CustomTextStyles.titleMediumPrimary_1,
          ),
          SizedBox(height: 8.v),
          Text(
            k0ItemModelObj.dynamicText2!,
            textAlign: TextAlign.center,
            style: CustomTextStyles.titleMediumPrimary_1,
          ),
        ],
      ),
    );
  }
}
