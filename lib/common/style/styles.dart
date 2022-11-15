import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/common/style/app_colors.dart';
import 'package:movie_app/common/style/text_styles.dart';

final ThemeData lightTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColors.redDark, // background (button) color
    ),
  ),
  primaryTextTheme: Typography(platform: TargetPlatform.iOS).black,
  textTheme: Typography(platform: TargetPlatform.iOS).black,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.backgroundLight,
  ),
  scaffoldBackgroundColor: AppColors.backgroundLight,
  backgroundColor: AppColors.backgroundLight,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: AppColors.black1),
    titleTextStyle: TextStyles.h2BlackMedium,
    backgroundColor: AppColors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: AppColors.white,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.dark, // For iOS (dark icons)
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.transparent,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.black1.withOpacity(0.2),),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.black1.withOpacity(0.2),
        ),

      )),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
        color: AppColors.redLight, borderRadius: BorderRadius.circular(50)),
    labelColor: AppColors.white,
    labelStyle: TextStyles.p1WhiteMedium,
    unselectedLabelColor: AppColors.blackOpacity5,
    unselectedLabelStyle: TextStyles.p1BlackMedium,
  ),
);

final ThemeData darkTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColors.redDark, // background (button) color
    ),
  ),
  primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
  textTheme: Typography(platform: TargetPlatform.iOS).white,
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: AppColors.background),
  backgroundColor: AppColors.background,
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: AppColors.white),
    elevation: 0,
    titleTextStyle: TextStyles.h2WhiteMedium,
    backgroundColor: AppColors.background,
    systemOverlayStyle: SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: AppColors.background,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.primary,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.primary),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: AppColors.primary,
        ),
      )),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
        color: AppColors.redDark, borderRadius: BorderRadius.circular(50)),
    labelColor: AppColors.white,
    labelStyle: TextStyles.p1WhiteMedium,
    unselectedLabelColor: Color(0x80ffffff),
    unselectedLabelStyle: TextStyle(
        fontSize: 14,
        color: AppColors.whiteOpacity5,
        fontWeight: FontWeight.w600),
  ),
);
