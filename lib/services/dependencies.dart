import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../app/events.dart';
import '../app/functions.dart';
import '../app/settings.dart';
import '../domain/classes/events_worker.dart';
import '../domain/db/events.dart';
import '../network/body/event.dart';
import '../network/client/big_data_client.dart';
import '../network/client/data_client.dart';
import '../network/client/registry_client.dart';
import '../network/entity/registry.dart';

class DependenciesService {
  static final sl = GetIt.instance;

  static const String appVersion = '1.0.9';

  static Future<void> setup() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    sl.registerFactory(() => preferences);

    if (getGuestToken() == null) {
      String uuid = const Uuid().v4();
      setGuestToken(uuid);
    }

    final StreamController<AppEvent> controller =
        StreamController<AppEvent>.broadcast();
    sl.registerFactory(() => controller);

    final dio = Dio();
    dio.options.connectTimeout = 15000;
    dio.options.receiveTimeout = 15000;
    dio.options.receiveDataWhenStatusError = true;
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        Map<String, dynamic> language = {
          'language': DependenciesService.getLanguageIso()
        };
        options.queryParameters.addAll(language);
        handler.next(options);
      },
      onError: (error, handler) async {
        try {
          handler.resolve(error.response!);
        } catch (e) {
          return handler.next(error);
        }
      },
    ));
    sl.registerFactory(() => dio);
    sl.registerFactory(() => APIDataClient(sl()));
    sl.registerFactory(() => APIRegistryClient(sl()));
    sl.registerFactory(() => APIBigDataClient(sl()));

    updateRegistryInfo();

    await Hive.initFlutter();
    Hive.registerAdapter(EventAdapter());
    await Hive.openBox<Event>(DbSettings.eventsBox);

    final eventManager = EventsManager();
    sl.registerFactory(() => eventManager);

    final eventsDb = EventsDb();
    sl.registerFactory(() => eventsDb);

    EventsWorker worker =
        EventsWorker(const Duration(seconds: 15), pushEventsCache);
    worker.start();
    sl.registerFactory(() => worker);
  }

  static EventsDb getEventsDb() {
    return sl<EventsDb>();
  }

  static void setHttpUserAgent(String userAgent) {
    sl<Dio>().options.headers["user-agent"] = userAgent;
  }

  static String? getGuestToken() {
    return sl<SharedPreferences>().getString('guest');
  }

  static void setGuestToken(String token) {
    sl<SharedPreferences>().setString('guest', token);
  }

  static Future<int> generateEventsId() async {
    int id = sl<SharedPreferences>().getInt('event_ids') ?? 0;
    id++;
    await sl<SharedPreferences>().setInt('event_ids', id);
    return id;
  }

  static bool isRatingWidgetShown() {
    return sl<SharedPreferences>().getBool('rating_widget_status') ?? false;
  }

  static void setRatingWidgetShown(bool isShown) {
    sl<SharedPreferences>().setBool('rating_widget_status', isShown);
  }

  static String? getLastKnownServerTimestamp() {
    return sl<SharedPreferences>().getString('server_timestamp');
  }

  static void setLastKnownServerTimestamp(String serverTimestamp) {
    sl<SharedPreferences>().setString('server_timestamp', serverTimestamp);
  }

  static int? getLanguageId() {
    return sl<SharedPreferences>().getInt('language_id');
  }

  static void setLanguageId(int id) {
    sl<SharedPreferences>().setInt('language_id', id);
  }

  static String? getLanguageIso() {
    return sl<SharedPreferences>().getString('language_iso');
  }

  static void setLanguageIso(String iso) {
    sl<SharedPreferences>().setString('language_iso', iso);
  }

  static bool isFirstTime() {
    return sl<SharedPreferences>().getBool('first_time') ?? true;
  }

  static void setNotFirstTime() {
    sl<SharedPreferences>().setBool('first_time', false);
  }

  static String? getLanguageDirection() {
    return sl<SharedPreferences>().getString('language_direction');
  }

  static void setLanguageDirection(String direction) {
    sl<SharedPreferences>().setString('language_direction', direction);
  }

  static String getAppStyle() {
    return sl<SharedPreferences>().getString('app_style') ??
        AppSettings.defaultStyle;
  }

  static void setAppStyle(String style) {
    sl<SharedPreferences>().setString('app_style', style);
  }

  static String? getFCMToken() {
    return sl<SharedPreferences>().getString('fcm_token');
  }

  static void setFCMToken(String fcmToken) {
    sl<SharedPreferences>().setString('fcm_token', fcmToken);
  }

  static String? getCountryName() {
    return sl<SharedPreferences>().getString('country_name');
  }

  static void setCountryName(String countryName) {
    sl<SharedPreferences>().setString('country_name', countryName);
  }

  static String? getCountryCode() {
    return sl<SharedPreferences>().getString('country_code');
  }

  static void setCountryCode(String countryCode) {
    sl<SharedPreferences>().setString('country_code', countryCode);
  }

  static String? getCountryCallingCode() {
    return sl<SharedPreferences>().getString('country_calling_code');
  }

  static void setCountryCallingCode(String countryCallingCode) {
    sl<SharedPreferences>()
        .setString('country_calling_code', countryCallingCode);
  }

  static String? getCountryFlag() {
    return sl<SharedPreferences>().getString('country_flag');
  }

  static void setCountryFlag(String countryFlag) {
    sl<SharedPreferences>().setString('country_flag', countryFlag);
  }

  static String? getCity() {
    return sl<SharedPreferences>().getString('city');
  }

  static void setCity(String city) {
    sl<SharedPreferences>().setString('city', city);
  }

  static String? getDeviceBrand() {
    return sl<SharedPreferences>().getString('device_brand');
  }

  static void setDeviceBrand(String deviceBrand) {
    sl<SharedPreferences>().setString('device_brand', deviceBrand);
  }

  static String? getDeviceName() {
    return sl<SharedPreferences>().getString('device_name');
  }

  static void setDeviceName(String deviceName) {
    sl<SharedPreferences>().setString('device_name', deviceName);
  }

  static String? getOsName() {
    return sl<SharedPreferences>().getString('os_name');
  }

  static void setOsName(String osName) {
    sl<SharedPreferences>().setString('os_name', osName);
  }

  static String? getOsVersion() {
    return sl<SharedPreferences>().getString('os_version');
  }

  static void setOsVersion(String osVersion) {
    sl<SharedPreferences>().setString('os_version', osVersion);
  }

  static bool isDeveloperMode() {
    return sl<SharedPreferences>().getBool('developer_mode') ?? false;
  }

  static void toggleDeveloperMode() {
    sl<SharedPreferences>().setBool('developer_mode', !isDeveloperMode());
  }

  static APIDataClient getDataClient() {
    return sl<APIDataClient>();
  }

  static APIRegistryClient getRegistryClient() {
    return sl<APIRegistryClient>();
  }

  static APIBigDataClient getBigDataClient() {
    return sl<APIBigDataClient>();
  }

  static void streamAppEvent(AppEvent event) {
    sl<StreamController<AppEvent>>().add(event);
  }

  static String? getRegistryUpdateDate() {
    return sl<SharedPreferences>().getString('registry_update_date');
  }

  static void setRegistryUpdateDate(String date) {
    sl<SharedPreferences>().setString('registry_update_date', date);
  }

  static Future<void> updateRegistryInfo() async {
    try {
      if (getRegistryUpdateDate() != null) {
        DateTime today =
            DateTime.parse(DateTime.now().toString().substring(0, 10));
        DateTime updateDate = DateTime.parse(getRegistryUpdateDate()!);
        int difference = today.difference(updateDate).inDays;
        if (difference < 1) {
          return;
        }
      }
      Registry registry =
          await DependenciesService.getRegistryClient().getUserRegistry();
      if (registry.location != null) {
        if (registry.location!.country != null) {
          if (registry.location!.country!.name != null) {
            DependenciesService.setCountryName(
                registry.location!.country!.name!);
          }
          if (registry.location!.country!.calling_code != null) {
            DependenciesService.setCountryCallingCode(
                registry.location!.country!.calling_code!);
          }
          if (registry.location!.country!.code != null) {
            DependenciesService.setCountryCode(
                registry.location!.country!.code!);
          }
          if (registry.location!.country!.flag != null) {
            if (registry.location!.country!.flag!.emoji != null) {
              DependenciesService.setCountryFlag(
                  registry.location!.country!.flag!.emoji!);
            }
          }
        }
        if (registry.location!.city != null) {
          DependenciesService.setCity(registry.location!.city!);
        }
      }
      if (registry.user_agent != null) {
        if (registry.user_agent!.device != null) {
          if (registry.user_agent!.device!.brand != null) {
            DependenciesService.setDeviceBrand(
                registry.user_agent!.device!.brand!);
          }
          if (registry.user_agent!.device!.name != null) {
            DependenciesService.setDeviceName(
                registry.user_agent!.device!.name!);
          }
        }
        if (registry.user_agent!.os != null) {
          if (registry.user_agent!.os!.name != null) {
            DependenciesService.setOsName(registry.user_agent!.os!.name!);
          }
          if (registry.user_agent!.os!.version != null) {
            DependenciesService.setOsVersion(registry.user_agent!.os!.version!);
          }
        }
      }
      String today = DateTime.now().toString().substring(0, 10);
      setRegistryUpdateDate(today);
    } catch (e, stackTrace) {
      AppFunctions.logException(e, stackTrace);
    }
  }

  static updateUserInfo() async {
    updateRegistryInfo();
  }

  static Future<void> pushEventsCache() async {
    try {
      List<Event> cachedEvents = getEventsDb().getCachedEvents();
      int length = cachedEvents.length >= 60 ? 60 : cachedEvents.length;
      for (int i = 0; i < length; i++) {
        if (cachedEvents[i].status != null) {
          if (cachedEvents[i].status == AppKeys.created) {
            DateTime now = DateTime.now().toUtc();
            DateTime eventTime = DateTime.parse(cachedEvents[i].eventTimestamp);
            if (now.difference(eventTime) > const Duration(seconds: 60)) {
              await AppFunctions.pushEventBackup(cachedEvents[i]);
            }
          } else if (cachedEvents[i].status == AppKeys.rejected) {
            if ((cachedEvents[i].trials ?? 0) >= 200) {
              DependenciesService.getEventsDb()
                  .deleteCachedEvent(cachedEvents[i].id);
            } else {
              await AppFunctions.pushEventBackup(cachedEvents[i]);
            }
          } else if (cachedEvents[i].status == AppKeys.accepted) {
            DependenciesService.getEventsDb()
                .deleteCachedEvent(cachedEvents[i].id);
          }
        }
      }
    } catch (e, stackTrace) {
      AppFunctions.logException(e, stackTrace, isBigDataError: true);
    }
  }
}
