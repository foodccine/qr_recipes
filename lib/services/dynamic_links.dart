import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import '../app/functions.dart';
import '../app/settings.dart';

class DynamicLinksService {
  static Future<void> setup(BuildContext context) async {
    FirebaseDynamicLinks.instance.getInitialLink().then((value) {
      if (value != null && Theme.of(context).platform != TargetPlatform.iOS) {
        if (value.link.path.contains("recipes")) {
          final String? recipeId = value.link.queryParameters['id'];
          if (recipeId != null) {
            Navigator.pushNamed(context, AppRoutes.mainRoute,
                arguments: int.parse(recipeId));
          }
        }
      }
    }).onError((e, stackTrace) {
      AppFunctions.logException(e, stackTrace);
    });

    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      if (dynamicLinkData.link.path.contains("recipes")) {
        final String? recipeId = dynamicLinkData.link.queryParameters['id'];
        if (recipeId != null) {
          Navigator.pushNamed(context, AppRoutes.mainRoute,
              arguments: int.parse(recipeId));
        }
      }
    }).onError((e, stackTrace) {
      AppFunctions.logException(e, stackTrace);
    });
  }
}
