import 'package:flutter/material.dart';

class AppColors {
  //Splash Screen Background Colors
  static Color splashScreenBgColor = const Color(0xffe9ffe7);

  //Scaffold Background Gradient Colors
  static Color bgGradientStartColor = const Color(0xffE2F9EE);
  static Color bgGradientEndColor = const Color.fromARGB(255, 218, 229, 194);

  //Default Colors
  static Color blackShadeColor = const Color(0xff272829);
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color transparentColor = Colors.transparent;
  static Color greyColor = Colors.grey;
  static Color blueGreyColor = Colors.blueGrey;

  //Text Colors
  static Color subHeadlineColor = const Color(0xff7B6C6C);

  //Widget Colors
  static Color bottomNavBarColor = const Color.fromARGB(255, 34, 30, 30);

  //Gradients
  static Gradient scaffoldBgGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.bgGradientStartColor,
      AppColors.bgGradientEndColor,
    ],
    stops: const [0.25, 1.0],
  );
}
