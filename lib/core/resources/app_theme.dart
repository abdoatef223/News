import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c19/core/resources/colors_manager.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.lightPrimaryColor
      )
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManager.lightPrimaryColor
      ),
      titleMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManager.lightSecondaryColor
      ),
      titleSmall: TextStyle(
        color: ColorsManager.greyColor,
        fontSize:12.sp,
        fontWeight: FontWeight.w500
      )
    ),
    tabBarTheme: TabBarThemeData(
      dividerHeight: 0,
      labelStyle: TextStyle(
        color: ColorsManager.lightPrimaryColor,
        fontWeight: FontWeight.w700,
        fontSize: 16.sp
      ) ,
      unselectedLabelStyle: TextStyle(
          color: ColorsManager.lightPrimaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp
      ),
      tabAlignment: TabAlignment.start,
      labelPadding: REdgeInsets.only(right: 16),
    ),
    colorScheme: ColorScheme.light(
      primary: ColorsManager.lightPrimaryColor,
      secondary: ColorsManager.lightSecondaryColor,
      tertiary: ColorsManager.greyColor,
      onPrimaryContainer: Colors.white.withValues(alpha: 0.5)
    )
  );
}