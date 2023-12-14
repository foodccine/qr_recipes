import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/dependencies.dart';
import 'colors_manager.dart';
import 'styles_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor[DependenciesService.getAppStyle()]!,
    primaryColorDark:
        AppColors.primaryDarkColor[DependenciesService.getAppStyle()]!,
    backgroundColor:
        AppColors.backgroundColor[DependenciesService.getAppStyle()]!,
    scaffoldBackgroundColor:
        AppColors.backgroundColor[DependenciesService.getAppStyle()]!,
    splashFactory: InkRipple.splashFactory,
    splashColor: AppColors.mainColor[DependenciesService.getAppStyle()]!
        .withOpacity(0.15),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.accentColor[DependenciesService.getAppStyle()]!,
      brightness: getBrightness(),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.primaryColor[DependenciesService.getAppStyle()]!,
      elevation: 0,
      titleTextStyle: getRegularStyle(
          color: AppColors.mainColor[DependenciesService.getAppStyle()]!,
          fontSize: 18),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: getBrightness(),
        systemNavigationBarIconBrightness: getBrightness(),
        statusBarIconBrightness: getBrightness(),
      ),
    ),
  );
}

Brightness getBrightness() {
  if (DependenciesService.getAppStyle() == 'dark') {
    return Brightness.light;
  } else {
    return Brightness.dark;
  }
}
