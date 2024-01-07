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
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.whiteOp100,
      surfaceTintColor: AppColors.whiteOp100
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.whiteOp100,
      dialBackgroundColor: AppColors.whiteOp100,
      dialTextColor: AppColors.blackOp100,
      dayPeriodTextColor: AppColors.blackOp100,
      hourMinuteTextColor: AppColors.blackOp100,
      // dialHandColor: AppColors.whiteOp100,
      // hourMinuteColor: AppColors.whiteOp100,
      // dayPeriodColor: AppColors.yellowOp100,
      // entryModeIconColor: AppColors.whiteOp100

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
