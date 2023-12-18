import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../app/settings.dart';
import '../network/client/data_client.dart';

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
        options.headers['Access-Control-Allow-Origin'] = '*';
        options.headers['Access-Control-Allow-Methods'] = '*';
        options.headers['Access-Control-Allow-Headers'] =
            'Access-Control-Allow-Headers, Content-Type, Authorization, Access-Control-Allow-Methods';
        options.headers['Content-Type'] = 'application/json';

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

  static int? getLanguageId() {
    return sl<SharedPreferences>().getInt('language_id');
  }

  static void setLanguageId(int id) {
    sl<SharedPreferences>().setInt('language_id', id);
  }

  static String getLanguageIso() {
    return sl<SharedPreferences>().getString('language_iso') ??
        AppSettings.defaultLanguageIso;
  }

  static void setLanguageIso(String iso) {
    sl<SharedPreferences>().setString('language_iso', iso);
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

  static APIDataClient getDataClient() {
    return sl<APIDataClient>();
  }
}
