import 'package:flutter/material.dart';

class AppColors {


  static const background = Color(0xFF0F1B2B);
  static const backgroundLight = Color(0xFFE5E5E5);
  static const lightBlue = Color(0xFF47CFFF);
  // static const borderBottomBar = Color(0xFF2B3543);
  static const borderBottomBarLight = Color(0x330f1b2b);
  static const borderBottomBarDark = Color(0xff2c3f5b);
  static const black = Color(0xFF000000);
  static const black1 = Color(0xFF0F1B2B);
  static const blackOpacity2 = Color(0x330F1B2B);
  static const blackOpacity5 = Color(0x800F1B2B);
  static const redDark = Color(0xffe51937);
  static const redLight = Color(0xffe51937);

  static const primary = Color(0xFF2B3543);

  static const radial1 = Color(0xFF0F1B2B);

  static const radial2 = Color(0xFF0A204A);

  static const dark = Color(0xFF060616);

  static const darkPurple = Color(0xFF23193D);

  static const pink = Color(0xFFD773AA);

  static const darkColor = Color(0xFF181722);

  static const lightDark = Color(0xFF191B2E);

  static const lightWhite = Color(0xFFCBD5E1);

  static const light1 = Color(0xFFF1F5F9);

  static const light4 = Color(0xFF1E293B);

  static const white = Color(0xFFFFFFFF);

  static final whiteOpacity5 = const Color(0xFFFFFFFF).withOpacity(0.5);

  static const lightGrey = Color(0xFF64748B);

  static const grey = Colors.grey;

  static const greyBottomNavBar = Color(0xFFC4C4C4);

  static const greyBottomIndividual = Color(0xFF8E9EB5);

  static const transparent = Colors.transparent;

  static const darkColor1 = Color(0xFF1E212C);

  static const darkColor2 = Color(0xFF121212);

  static const green = Color(0xFF2ADF9E);
  static const orange= Color(0xFFF0780A);

  static const yellow = Color(0xFFF0B90A);

  static const lightYellow = Color(0xFFFDF5DA);

  static const blue = Color(0xFF18A0FB);

  static const purple = Color(0xFFB800E7);

  static const purpleBed = Color(0xFF9945FF);

  static const lightPurple = Color(0xFFAD82F3);

  static const tick = Color(0xFF51638D);

  static const rank1 = Color(0xFF94D4FF);
  static const rank2 = Color(0xFF5FBFFF);
  static const rank3 = Color(0xFF1DA4FF);
  static const rank4 = Color(0xFF0092F3);
  static const rank5 = Color(0xFF426BFF);

  static const commonBedTopLeft = Color(0xFF272839);

  static const uncommonBedTopLeft = Color(0xFF172932);

  static const rareBedTopLeft = Color(0xFF18203b);

  static const epicBedTopLeft = Color(0xFF2b1f23);

  static const legendaryBedTopLeft = Color(0xFF221a3c);

  static const commonBed = Color(0xFFCBD5E1);

  static const uncommonBed = Color(0xFF2ADF9E);

  static const rareBed = Color(0xFF426BFF);

  static const epicBed = Color(0xFFF0780A);

  static const legendaryBed = Color(0xFF9945FF);

  static const ruby = Color(0XFFFC476A);

  static const amethst = Color(0xFF7962E7);

  static final backgroundDialog = const Color(0xFF060616).withOpacity(0.9);

  static LinearGradient gradientBlue = const LinearGradient(
      colors: [blue, Color(0xFF426BFF)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const gradientBlueAccent = LinearGradient(
      colors: [Color(0xFF62519F), Color(0xFF396CBB), Color(0xFF549CBF)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);

  static const bluesDark = Color(0xFF426BFF);

  static const gradientBluePurple = LinearGradient(
      colors: [blue, purple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const backgroundApp = LinearGradient(
      colors: [Color(0xFF1A1717), Color(0xFF7A0303), Color(0xFF1A1717)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static LinearGradient gradientBluePurpleStaking = LinearGradient(
      colors: [blue.withOpacity(0.3), purple.withOpacity(0.3)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const blueGradient = LinearGradient(
      colors: [blue, blue],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const gradientGacha =  LinearGradient(
      colors: [blue, rank5],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const gradientBlueButton = LinearGradient(
      colors: [blue, bluesDark],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static LinearGradient gradientWhiteBorderLeftToRight = LinearGradient(
      colors: [Colors.white.withOpacity(0), Colors.white.withOpacity(0.2)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  static LinearGradient gradientWhiteBorderRightToLeft = LinearGradient(
      colors: [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  static const gradientROI = LinearGradient(
      colors: [Color(0xFF1a1f37), Color(0xFF211a37)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const tutorialBgr = Color(0xff092128);

  const AppColors._();
}
