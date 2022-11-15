import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:movie_app/common/style/app_colors.dart';

class TextStyles {
  static const h1BlackBold = TextStyle(fontSize: 32, color: AppColors.black, fontWeight: FontWeight.w500);
  static const h1WhiteBold = TextStyle(fontSize: 32, color: AppColors.white, fontWeight: FontWeight.w500);
  static const h2BlackMedium = TextStyle(fontSize: 24, color: AppColors.black1, fontWeight: FontWeight.w500);
  static const h2WhiteMedium = TextStyle(fontSize: 24, color: AppColors.white, fontWeight: FontWeight.w500);
  static const h2Grey = TextStyle(fontSize: 28, color: AppColors.grey, fontWeight: FontWeight.w400);
  static const p1WhiteBold = TextStyle(fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w500);
  static const p1WhiteMedium = TextStyle(fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w600);
  static const p1WhiteMedium5 = TextStyle(fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w400);
  static const p1BlackMedium = TextStyle(fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w400);

  // h1
  static const h1Medium = TextStyle(fontSize: 24, fontWeight: FontWeight.w500);

  // h2
  static const h2Semibold = TextStyle(fontSize: 24, fontWeight: FontWeight.w600);

  // h3
  static const h3 = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  // h4
  static const h4 = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static const h4MediumLightBlue = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.lightBlue);
  static const h4Medium = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

}
