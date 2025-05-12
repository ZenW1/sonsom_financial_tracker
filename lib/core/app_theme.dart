import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_string.dart';
import 'app_style.dart';
import 'dimensions.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightAppTheme = ThemeData(
    useMaterial3: true,
     fontFamilyFallback: [
       'Battambang'
     ],

    primarySwatch: MaterialColor(AppColors.primary.value, {
      50: AppColors.primary.withOpacity(0.1),
      100: AppColors.primary.withOpacity(0.2),
      200: AppColors.primary.withOpacity(0.3),
      300: AppColors.primary.withOpacity(0.4),
      400: AppColors.primary.withOpacity(0.5),
      500: AppColors.primary.withOpacity(0.6),
      600: AppColors.primary.withOpacity(0.7),
      700: AppColors.primary.withOpacity(0.8),
    }),
    appBarTheme:  AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontSize: 18,
        fontFamily: AppString.appFont,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
    ),
    cardTheme: const CardTheme(
      color: AppColors.backgroundColor,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.blackColor,
    ),
    // iconButtonTheme: IconButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all<Color>(AppColors.blackColor),
    //     foregroundColor: WidgetStateProperty.all<Color>(AppColors.blackColor),
    //   ),
    // ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        // side: BorderSide(color: AppColors.primary, width: 1.0),
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(enabledBorder: enabledBorder, focusedBorder: focusedBorder, errorBorder: errorBorder, border: inputBorder),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.backgroundColor,
    ),
    fontFamily: AppString.appFont,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        alignment: Alignment.center,
        foregroundColor: AppColors.blackColor,
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radiusLarge())),
        ),
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.grey, width: 2),
      ),
      dialHandColor: AppColors.primary,
      hourMinuteColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? const Color(0xFFF4511E) : Colors.black12),
      hourMinuteTextColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? Colors.black54 : Colors.grey),
      dayPeriodBorderSide: const BorderSide(color: Colors.grey),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      dayPeriodColor: Colors.transparent,
      dayPeriodTextColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? const Color(0xFFF4511E) : Colors.black12),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black12),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
        wordSpacing: 1.5,
      ),
      displayMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
        wordSpacing: 1.5,
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
      // onPrimary: AppColors.whiteColor,
      secondary: AppColors.secondaryColor,
      // onSecondary: AppColors.whiteColor,
      error: Colors.red,
      onError: Colors.red,
      // surface: AppColors.backgroundColor,
      // onSurface: AppColors.backgroundColor,
      brightness: Brightness.light,
    ),
  );
}
