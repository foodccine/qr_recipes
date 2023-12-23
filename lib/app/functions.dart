import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../presentation/resources/conversion_manager.dart';
import '../presentation/resources/strings_manager.dart';
import '../services/dependencies.dart';

class AppFunctions {
  static String minToTime(int min) {
    String time;
    if (min >= 60) {
      if (min >= 1440) {
        time =
            '${min ~/ 1440} ${AppStrings.units['day']![DependenciesService.getLanguageIso()]!}';
      } else {
        int hours = min ~/ 60;
        int minutes = min - (hours * 60);
        if (minutes > 0) {
          time =
              '$hours ${AppStrings.units['hr']![DependenciesService.getLanguageIso()]!} ${AppStrings.andAPR[DependenciesService.getLanguageIso()]!} $minutes ${AppStrings.units['min']![DependenciesService.getLanguageIso()]!}';
        } else {
          time =
              '$hours ${AppStrings.units['hr']![DependenciesService.getLanguageIso()]!}';
        }
      }
    } else {
      time =
          '$min ${AppStrings.units['min']![DependenciesService.getLanguageIso()]!}';
    }
    return time;
  }

  static Future<Map<String, dynamic>> parseJsonFromAssets(
      String assetsPath) async {
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }

  static String convertDateTimeDisplay(String date) {
    final DateFormat displayFormatter = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormatter = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormatter.parse(date);
    final String formatted = serverFormatter.format(displayDate);
    return formatted;
  }

  static String getIntegerFractionString(double quantity) {
    int fraction = int.parse(quantity.toString().split(".")[0]);
    return fraction == 0 ? '' : '$fraction ';
  }

  static String getDoubleFraction(double quantity) {
    double fraction = quantity - int.parse(quantity.toString().split(".")[0]);
    return fraction == 0 ? '' : '${AppConversion.quantityToText[fraction]} ';
  }

  static void launchURL(String link) async {
    try {
      Uri url = Uri.parse(link);
      await launchUrl(url);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> callPhoneNumber(String phoneNumber) async {
    try {
      var phoneURL = "tel://$phoneNumber";
      Uri uri = Uri.parse(phoneURL);
      launchUrl(uri).then((value) => null).onError((e, stackTrace) {});
    } catch (e, stackTrace) {
      print(stackTrace);
    }
  }

  static Future<void> openWhatsapp(String whatsapp) async {
    try {
      var whatsappUrl = "whatsapp://send?phone=$whatsapp";
      Uri url = Uri.parse(whatsappUrl);
      launchUrl(url).then((value) => null).onError((e, stackTrace) {
        print(stackTrace);
      });
    } catch (e, stackTrace) {
      print(stackTrace);
    }
  }
}
