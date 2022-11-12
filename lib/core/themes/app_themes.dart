import 'package:anime_app/core/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

final iconThemeData = IconThemeData(color: AppColors.purple500);

final appTheme = ThemeData(
  cupertinoOverrideTheme: CupertinoThemeData(
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        color: AppColors.purple500,
        fontFamily: 'Montserrat',
      ),
    ),
  ),
  fontFamily: 'Montserrat',
  scaffoldBackgroundColor: AppColors.black0,//purple50,//.withOpacity(0.8),
  textTheme: const TextTheme(),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.indigo800,
    selectionHandleColor: AppColors.indigo800,
    selectionColor: AppColors.indigo800,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    actionsIconTheme: iconThemeData,
    iconTheme: iconThemeData,
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.purple200,
      statusBarColor: Colors.transparent,
    ),
  ),
  iconTheme: iconThemeData,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 12,
    backgroundColor: AppColors.white.withOpacity(0.8),
    selectedIconTheme: IconThemeData(
      color: AppColors.purple500!,
      size: 27,
    ),
    selectedLabelStyle: AppTextStyle.s15w500,
    unselectedIconTheme: const IconThemeData(
      color: AppColors.black500,
      size: 23,
    ),
    unselectedLabelStyle: AppTextStyle.s14w500,
  ),
  colorScheme: ColorScheme(
    background: AppColors.white,
    onBackground: AppColors.purple100!,
    brightness: Brightness.light,
    error: Colors.purpleAccent,
    onError: AppColors.purple200!,
    secondary: AppColors.purple500!,
    primary: AppColors.indigo900!,
    onSurface: AppColors.purple400!,
    surface: AppColors.purple200!,
    onPrimary: AppColors.indigo900!,
    onSecondary: AppColors.purpleAccent!,
  ),
);
