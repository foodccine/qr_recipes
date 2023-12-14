import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';

import '../app/settings.dart';
import '../network/body/event.dart';
import '../services/dependencies.dart';
import 'functions.dart';

enum AppEventType {
  applicationOpened,
  applicationInBackground,
  applicationInForeground,
  applicationClosed,
  agreementAccepted,
  agreementDeclined,
  notificationOpened,
  screenOpened,
  screenClosed,
  languageDialogOpened,
  privacyPolicyDialogOpened,
  feedbackDialogOpened,
  supportDialogOpened,
  supportMessageSent,
  feedbackMessageSent,
  languageSelected,
  changeLanguage,
}

class AppEvent {
  final AppEventType type;
  final Map data;

  AppEvent(this.type, this.data);
}

class EventsManager implements EventsManagerFunctions {
  @override
  applicationClosed({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  @override
  applicationOpened({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  @override
  screenClosed({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  @override
  screenOpened({required AppEvent appEvent}) {
    passEvent(appEvent);
    try {
      FirebaseAnalytics.instance
          .setCurrentScreen(screenName: appEvent.data[AppKeys.screenName]);
    } catch (e, stackTrace) {
      AppFunctions.logException(e, stackTrace);
    }
  }

  @override
  applicationInBackground({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  @override
  applicationInForeground({required AppEvent appEvent}) {
    DependenciesService.updateUserInfo();
    passEvent(appEvent);
  }

  @override
  notificationOpened({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  @override
  agreementAccepted({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  @override
  agreementDeclined({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  @override
  languageDialogOpened({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  @override
  languageSelected({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  @override
  feedbackDialogOpened({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  @override
  privacyPolicyDialogOpened({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  @override
  supportDialogOpened({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  @override
  feedbackMessageSent({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  @override
  supportMessageSent({required AppEvent appEvent}) {
    passEvent(appEvent);
  }

  void passEvent(AppEvent appEvent) {
    try {
      pushAppEvent(appEvent);
    } catch (e, stackTrace) {
      AppFunctions.logException(e, stackTrace);
    }
  }
}

Future<void> pushAppEvent(AppEvent appEvent) async {
  int id = await DependenciesService.generateEventsId();
  if (id >= AppSettings.appRatingOnThreshold) {
    if (id % AppSettings.appRatingOnThreshold == 0) {
      DependenciesService.setRatingWidgetShown(true);
    } else if (id % AppSettings.appRatingOnThreshold ==
        AppSettings.appRatingOffDifference) {
      DependenciesService.setRatingWidgetShown(false);
    }
  } else {
    DependenciesService.setRatingWidgetShown(false);
  }
  Event event = Event(
      id,
      DependenciesService.getGuestToken()!,
      DependenciesService.getFCMToken(),
      appEvent.type.toString(),
      DateTime.now().toUtc().toIso8601String(),
      json.encode(appEvent.data),
      DependenciesService.getCountryName(),
      DependenciesService.getCountryCode(),
      DependenciesService.getCity(),
      DependenciesService.getDeviceBrand(),
      DependenciesService.getDeviceName(),
      DependenciesService.getOsName(),
      DependenciesService.getOsVersion(),
      DependenciesService.appVersion,
      null,
      DependenciesService.getLanguageIso());
  AppFunctions.pushEvent(event);
}

abstract class EventsManagerFunctions {
  applicationOpened({required AppEvent appEvent});

  applicationInBackground({required AppEvent appEvent});

  applicationInForeground({required AppEvent appEvent});

  applicationClosed({required AppEvent appEvent});

  agreementAccepted({required AppEvent appEvent});

  agreementDeclined({required AppEvent appEvent});

  notificationOpened({required AppEvent appEvent});

  screenOpened({required AppEvent appEvent});

  screenClosed({required AppEvent appEvent});

  languageDialogOpened({required AppEvent appEvent});

  privacyPolicyDialogOpened({required AppEvent appEvent});

  feedbackDialogOpened({required AppEvent appEvent});

  supportDialogOpened({required AppEvent appEvent});

  languageSelected({required AppEvent appEvent});

  supportMessageSent({required AppEvent appEvent});

  feedbackMessageSent({required AppEvent appEvent});
}
