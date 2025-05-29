import 'package:flutter/material.dart';

class AppColors {
  factory AppColors() => _instance;

  AppColors._();

  static final AppColors _instance = AppColors._();

  static const Color primary = Color(0xFF0666EB);
  static const Color secondaryColor = Color(0xFF1D2846);
  static const Color ternaryColor = Color(0xFFaea4c3);
  static const Color greyColor = Color(0xFF959DA3);
  static const Color blackColor = Color(0xFF121212);
  static const Color redColor = Color(0xFFE44646);
  static const Color backgroundColor = Color(0xFFF7F7F9);
  static const Color backgroundGrey = Color(0xFFF1F1F1);
  static const Color lightGreyColor = Color(0xFFF5F5F5);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color yellowColor = Color(0xFFF2B917);
  static const Color pinkColor = Color(0xFFF579C1);
  static const Color orangeColor = Color(0xFFF98516);
  static const Color goldColor = Color(0xFFF0952C);
  static const Color greenColor = Color(0xFF4ACC4E);
  static Color shadowColor = const Color(0xFFC4C4C4);

  static LinearGradient appGradient = LinearGradient(
    colors: [
      AppColors.primary.withOpacity(0.5),
      AppColors.primary.withOpacity(0.5),
      const Color(0xFF2F9AE4),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topCenter,
  );

  static LinearGradient backgroundGradient = LinearGradient(
    colors: [
      AppColors.backgroundColor,
      AppColors.whiteColor.withOpacity(0.15),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topCenter,
  );



  // static LinearGradient strokePinkColor = LinearGradient(
  //   colors: [
  //     Color(0xFF2E0926).withOpacity(0.1),
  //     Color(0xFFFF8FC5),
  //     Color(0xFFFF8FC5),
  //   ],
  //   begin: Alignment.topRight,
  //   end: Alignment.centerLeft,
  // );
}

class AppDarkTheme {
  factory AppDarkTheme() => _instance;

  AppDarkTheme._();

  static final AppDarkTheme _instance = AppDarkTheme._();

  static const Color primary = Color(0xFF1976D2);
  static const Color secondaryColor = Color(0xFF4CAF50);
  static const Color ternaryColor = Color(0xFF9C27B0);
  static const Color greyColor = Color(0xFF607D8B);
  static const Color blackColor = Color(0xFF1C2358);
  static const Color redColor = Color(0xFFD32F2F);
  static const Color backgroundColor = Color(0xFF263238);
  static const Color backgroundGrey = Color(0xFF37474C);
  static const Color lightGreyColor = Color(0xFFD9D9D9);
  static const  Color darkGreyColor = Color(0xFF919191);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color yellowColor = Color(0xFFFBC02D);
  static const Color pinkColor = Color(0xFFE91E63);
  static const Color orangeColor = Color(0xFFFF9800);
  static const Color greenColor = Color(0xFF4CAF50);

  static Color shadowColor = const Color(0xFF37474C);
}
