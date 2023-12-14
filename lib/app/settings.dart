import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSettings {
  static const bool showBanner = false;
  static const String initialRoute = AppRoutes.mainRoute;
  static const String defaultStyle = 'dark';
  static const String defaultLanguageIso = 'en';
  static const String defaultLanguageDirectionStr = 'ltr';
  static const TextDirection defaultLanguageDirection = TextDirection.ltr;
  static const String defaultThemeType = 'dark';
  static const int appRatingOnThreshold = 500;
  static const int appRatingOffDifference = 150;
}

class DbSettings {
  static const String eventsBox = 'events';
}

class DynamicLinksSettings {
  static const String recipeLink = 'https://foodccine.com/recipes';
  static const String prefix = 'https://foodccine.page.link';
  static const String androidPackage = 'com.foodccine.app';
  static const String iosBundle = 'com.foodccine.recipes';
  static const String appId = '1661072924';
}

class AppKeys {
  static const String screenName = 'screen_name';
  static const String languageIso = 'language_iso';
  static const String status = 'status';
  static const String created = 'created';
  static const String accepted = 'accepted';
  static const String rejected = 'rejected';
}

class AppRoutes {
  static const String splashRoute = 'splash';
  static const String termsRoute = 'terms';
  static const String mainRoute = 'main';
}

class AppScreens {
  static const String splashScreen = 'splash_screen';
  static const String termsScreen = 'terms_screen';
  static const String mainScreen = 'main_screen';
}
