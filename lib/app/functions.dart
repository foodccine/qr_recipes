import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/settings.dart';
import '../network/body/event.dart';
import '../network/response/event_push_response.dart';
import '../presentation/resources/assets_manager.dart';
import '../presentation/resources/strings_manager.dart';
import '../presentation/resources/styles_manager.dart';
import '../services/dependencies.dart';

class AppFunctions {
  static void showAlertMessage(context, message, {duration = 1000}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppVectors.alertCircleIcon,
            width: 20.sp,
            height: 20.sp,
          ),
          SizedBox(width: 15.sp),
          Text(
            message,
            textAlign: TextAlign.center,
            style: getRegularStyle(
              fontSize: 15.sp,
              color: Colors.white,
            ).copyWith(height: 0),
          ),
        ],
      ),
      duration: Duration(milliseconds: duration),
    ));
  }

  static void showErrorMessage(context, message, {duration = 1000}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppVectors.crossCircleIcon,
            width: 20.sp,
            height: 20.sp,
          ),
          SizedBox(width: 15.sp),
          Text(
            message,
            textAlign: TextAlign.center,
            style: getRegularStyle(
              fontSize: 15.sp,
              color: Colors.white,
            ).copyWith(height: 0),
          ),
        ],
      ),
      duration: Duration(milliseconds: duration),
    ));
  }

  static void showSuccessMessage(context, message, {duration = 1000}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppVectors.checkCircleIcon,
            width: 20.sp,
            height: 20.sp,
          ),
          SizedBox(width: 15.sp),
          Text(
            message,
            textAlign: TextAlign.center,
            style: getRegularStyle(
              fontSize: 15.sp,
              color: Colors.white,
            ).copyWith(height: 0),
          ),
        ],
      ),
      duration: Duration(milliseconds: duration),
    ));
  }

  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  static Future<String> createDynamicLink(
      int id, String title, String image) async {
    try {
      final dynamicLinkParams = DynamicLinkParameters(
        link: Uri.parse('${DynamicLinksSettings.recipeLink}?id=$id'),
        uriPrefix: DynamicLinksSettings.prefix,
        androidParameters: const AndroidParameters(
            packageName: DynamicLinksSettings.androidPackage,
            minimumVersion: 0),
        iosParameters: const IOSParameters(
          appStoreId: DynamicLinksSettings.appId,
          bundleId: DynamicLinksSettings.iosBundle,
          minimumVersion: "1.0.1",
        ),
        socialMetaTagParameters: SocialMetaTagParameters(
          title: title,
          description: AppStrings.appShareDescription[
              DependenciesService.getLanguageIso() ??
                  AppSettings.defaultLanguageIso]!,
          imageUrl: Uri.parse(image),
        ),
      );
      ShortDynamicLink link =
          await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
      return link.shortUrl.toString();
    } catch (e, stackTrace) {
      AppFunctions.logException(e, stackTrace);
      return "https://foodccine.page.link/app";
    }
  }

  static Future<void> shareItem(int id, String title, String image) async {
    try {
      String link = await createDynamicLink(id, title, image);
      String text = '$title: $link';
      Share.shareWithResult(text).then((value) {
        //Shared Success
      }).onError((e, stackTrace) {
        AppFunctions.logException(e, stackTrace);
      });
    } catch (e, stackTrace) {
      AppFunctions.logException(e, stackTrace);
    }
  }

  static Future<void> sendViaWhatsapp(
    int id,
    String title,
    String image,
    String number,
  ) async {
    try {
      String link = await createDynamicLink(id, title, image);
      String text = '$title: $link';
      var whatsappUrl = "whatsapp://send?phone=$number&text=$text";
      Uri url = Uri.parse(whatsappUrl);
      launchUrl(url).then((value) => null).onError((e, stackTrace) {
        AppFunctions.logException(e, stackTrace);
      });
    } catch (e, stackTrace) {
      AppFunctions.logException(e, stackTrace);
    }
  }

  static void logException(e, stackTrace, {isBigDataError = false}) async {
    print('\x1B[31m${e.toString() + stackTrace.toString()}\x1B[0m');
  }

  static void pushEvent(Event event) async {
    try {
      DependenciesService.getEventsDb().cacheEvent(event.id, event);
      DependenciesService.getBigDataClient()
          .sendEvent(event)
          .timeout(const Duration(milliseconds: 1000))
          .then((value) {
        DependenciesService.getEventsDb()
            .changeEventStatus(event.id, AppKeys.accepted);
        if (value.serverTimeStamp != null) {
          DependenciesService.setLastKnownServerTimestamp(
              value.serverTimeStamp!);
        }
      }).onError((e, stackTrace) {
        AppFunctions.logException(e, stackTrace, isBigDataError: true);
        DependenciesService.getEventsDb().changeEventStatusAndTimestamp(
            event.id,
            AppKeys.rejected,
            DependenciesService.getLastKnownServerTimestamp() ??
                event.eventTimestamp);
      });
    } catch (e, stackTrace) {
      AppFunctions.logException(e, stackTrace, isBigDataError: true);
    }
  }

  static Future<void> pushEventBackup(Event event) async {
    try {
      DependenciesService.getEventsDb().increaseTrials(event.id);
      EventPushResponse response = await DependenciesService.getBigDataClient()
          .sendEvent(event)
          .timeout(const Duration(milliseconds: 500));
      DependenciesService.getEventsDb()
          .changeEventStatus(event.id, AppKeys.accepted);
      if (response.serverTimeStamp != null) {
        DependenciesService.setLastKnownServerTimestamp(
            response.serverTimeStamp!);
      }
    } catch (e, stackTrace) {
      AppFunctions.logException(e, stackTrace, isBigDataError: true);
      DependenciesService.getEventsDb()
          .changeEventStatus(event.id, AppKeys.rejected);
      AppFunctions.logException(e, stackTrace, isBigDataError: true);
    }
  }
}
