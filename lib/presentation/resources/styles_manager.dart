import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/settings.dart';
import '../../services/dependencies.dart';
import 'fonts_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily,
    FontWeight fontWeight, double fontHeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      height: fontHeight,
      color: color);
}

TextStyle getRegularStyle(
    {required double fontSize,
    String? fontFamily,
    Color color = Colors.white}) {
  return _getTextStyle(
    fontSize *
        FontConstants.fontScaleFactors[DependenciesService.getLanguageIso() ??
            AppSettings.defaultLanguageIso]!,
    fontFamily ??
        FontConstants.fontFamily[DependenciesService.getLanguageIso() ??
            AppSettings.defaultLanguageIso]!,
    FontWeights.regular,
    FontConstants.fontHeights[DependenciesService.getLanguageIso() ??
        AppSettings.defaultLanguageIso]!,
    color,
  );
}

TextStyle getMediumStyle(
    {required double fontSize, String? fontFamily, color = Colors.white}) {
  return _getTextStyle(
    fontSize *
        FontConstants.fontScaleFactors[DependenciesService.getLanguageIso() ??
            AppSettings.defaultLanguageIso]!,
    fontFamily ??
        FontConstants.fontFamily[DependenciesService.getLanguageIso() ??
            AppSettings.defaultLanguageIso]!,
    FontWeights.medium,
    FontConstants.fontHeights[DependenciesService.getLanguageIso() ??
        AppSettings.defaultLanguageIso]!,
    color,
  );
}

TextStyle getBoldStyle(
    {required double fontSize, String? fontFamily, color = Colors.white}) {
  return _getTextStyle(
    fontSize *
        FontConstants.fontScaleFactors[DependenciesService.getLanguageIso() ??
            AppSettings.defaultLanguageIso]!,
    fontFamily ??
        FontConstants.fontFamily[DependenciesService.getLanguageIso() ??
            AppSettings.defaultLanguageIso]!,
    FontWeights.bold,
    FontConstants.fontHeights[DependenciesService.getLanguageIso() ??
        AppSettings.defaultLanguageIso]!,
    color,
  );
}

bool isRTL() {
  if (DependenciesService.getLanguageDirection() != null) {
    if (DependenciesService.getLanguageDirection() == 'rtl') {
      return true;
    } else {
      return false;
    }
  } else {
    if (AppSettings.defaultLanguageDirection == TextDirection.rtl) {
      return true;
    } else {
      return false;
    }
  }
}

class StatusBarStyle {
  static const SystemUiOverlayStyle statusBarStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF000000),
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  );
}
