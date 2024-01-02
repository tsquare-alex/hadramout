import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/themes/colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    fontFamily: 'Cairo',
    colorScheme: const ColorScheme.light(
      primary: AppColors.yellowOp100,
      shadow: AppColors.whiteOp100,
      onPrimary: AppColors.darkBlue,
      onPrimaryContainer: AppColors.whiteOp75,
      secondaryContainer: AppColors.brownOp25,
    ),
    dialogBackgroundColor: AppColors.whiteOp100,
    dialogTheme: const DialogTheme(
      backgroundColor: AppColors.whiteOp100,
      shadowColor: AppColors.whiteOp100,
    ),
    scaffoldBackgroundColor: AppColors.greyOp100,
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: MyColors.primary,
    // ),
    // focusColor: MyColors.primary,
    // primaryColor: MyColors.primary,
    // fontFamily: GoogleFonts.tajawal().fontFamily,
    // textTheme: TextTheme(
    //   titleMedium: GoogleFonts.tajawal(fontSize: 14),
    // ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: MyColors.primary,
    //   foregroundColor: Colors.white,
    //   // systemOverlayStyle: SystemUiOverlayStyle(
    //   //   statusBarIconBrightness: Brightness.dark,
    //   //   statusBarColor: Colors.transparent,
    //   // ),
    // ),
  );
}
