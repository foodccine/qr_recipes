import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSettings {
  static const bool showBanner = false;
  static const String initialRoute = AppRoutes.recipeRoute;
  static const String defaultStyle = 'light';
  static const String defaultLanguageIso = 'ar';
  static const String defaultLanguageDirectionStr = 'rtl';
  static const TextDirection defaultLanguageDirection = TextDirection.rtl;
  static const int appRatingOnThreshold = 500;
  static const int appRatingOffDifference = 150;
  static const String defaultBrandId = 'foodccine';
  static const String defaultBrandColor = '#C3424D';
  static const String defaultBrandDomain = 'https://qr.foodccine.com/';
}

class DbSettings {
  static const String eventsBox = 'events';
}

class AppKeys {
  static const String screenName = 'screen_name';
  static const String languageIso = 'language_iso';
  static const String status = 'status';
  static const String created = 'created';
  static const String accepted = 'accepted';
  static const String rejected = 'rejected';
  static const String recipePath = 'recipe';
  static const String recipeId = 'recipeId';
}

class AppRoutes {
  static const String recipeRoute = 'recipe';
}

class AppScreens {
  static const String recipeScreen = 'recipe_screen';
}
