import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      prefixIconColor: ColorsManager.black,
      suffixIconColor: ColorsManager.black,
    ),
    tabBarTheme: TabBarThemeData(
      labelStyle: GoogleFonts.inter(
        color: ColorsManager.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        color: ColorsManager.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      tabAlignment: TabAlignment.start,
      labelColor: ColorsManager.black,
      indicatorColor: ColorsManager.black,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerHeight: 0,
      dividerColor: ColorsManager.black,
    ),
    primaryColor: ColorsManager.black,
    primaryColorLight: ColorsManager.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.white,
      centerTitle: true,
      foregroundColor: ColorsManager.black,
      titleTextStyle: GoogleFonts.inter(
        color: ColorsManager.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    scaffoldBackgroundColor: ColorsManager.white,
    textTheme: TextTheme(
      labelMedium: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.inter(
        color: ColorsManager.black,
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.inter(
        color: ColorsManager.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.inter(
        color: ColorsManager.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.inter(
        color: ColorsManager.gray,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: IconThemeData(
      size: 34.sp,
      color: ColorsManager.white,
    ),
  );
  static final ThemeData dark = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      prefixIconColor: ColorsManager.white,
      suffixIconColor: ColorsManager.white,
    ),
    tabBarTheme: TabBarThemeData(
      labelStyle: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      tabAlignment: TabAlignment.start,
      labelColor: ColorsManager.white,
      indicatorColor: ColorsManager.white,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerHeight: 0,
      dividerColor: ColorsManager.white,
    ),
    primaryColor: ColorsManager.white,
    primaryColorLight: ColorsManager.black,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.black,
      centerTitle: true,
      foregroundColor: ColorsManager.white,
      titleTextStyle: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    scaffoldBackgroundColor: ColorsManager.black,
    textTheme: TextTheme(
      labelMedium: GoogleFonts.inter(
        color: ColorsManager.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.inter(
        color: ColorsManager.gray,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: GoogleFonts.inter(
        color: ColorsManager.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: IconThemeData(
      size: 34.sp,
      color: ColorsManager.black,
    ),
  );
}
