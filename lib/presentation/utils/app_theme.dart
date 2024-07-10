import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:devxraju_flutter_provider/presentation/utils/styles.dart';

import 'app_colors.dart';

class AppTheme {
  static final theme = ThemeData(
    primaryColor: AppColors.primaryBlue,
    backgroundColor: AppColors.lightBackground,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: AppColors.black),
      iconTheme: IconThemeData(color: Colors.black),
      color: AppColors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    scrollbarTheme: const ScrollbarThemeData(minThumbLength: 93),
    textTheme: TextTheme(
      subtitle2: Styles.tsDefaultNormal16.copyWith(
        color: AppColors.greyText,
      ),
    ),
    dividerColor: AppColors.dividerColor,
    checkboxTheme: CheckboxThemeData(
      checkColor:
      MaterialStateColor.resolveWith((states) => AppColors.primaryBlue),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: Styles.tsDefaultBold14,
        unselectedLabelStyle: Styles.tsDefaultNormal14,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.grey,
        elevation: 0),
  );
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Degular",
    primaryColor: AppColors.primaryBlue,
    backgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: AppColors.white),
      iconTheme: IconThemeData(color: Colors.white),
      color: AppColors.darkBackground,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.darkBackground,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    scaffoldBackgroundColor: AppColors.darkBackground,
    scrollbarTheme: const ScrollbarThemeData(minThumbLength: 93),
    dividerColor: AppColors.dividerColorDark,
    checkboxTheme: CheckboxThemeData(
      fillColor:
      MaterialStateColor.resolveWith((states) => AppColors.primaryBlue),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.darkBackground,
    ),
    bottomSheetTheme:const BottomSheetThemeData(
      backgroundColor: AppColors.darkBackground,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackground,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: Styles.tsDefaultBold14,
      unselectedLabelStyle: Styles.tsDefaultNormal14,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.grey,
      elevation: 0,
    ),
  );
}
