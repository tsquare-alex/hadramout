import 'package:flutter/material.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import 'MyText.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? fontSize;
  final double? height;
  final double? elevation;
  final bool? disabled;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Widget? widget;

  const DefaultButton({
    super.key,
    required this.title,
    this.onTap,
    this.color,
    this.disabled,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.width,
    this.height,
    this.fontWeight,
    this.elevation, this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled ?? false,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 45,
        margin:
            margin ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(10),
              side: BorderSide(
                color: borderColor??AppColors.yellowOp75 ,
                width: 1,
              ),
            ),
            elevation: elevation ?? 0,
          ),
          child: widget??MyText(
            title: title,
            size: fontSize ?? 11,
            color: textColor ?? Colors.white,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
