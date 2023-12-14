import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AppCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'foodccine';

  static final AppCacheManager _instance = AppCacheManager._();
  factory AppCacheManager() {
    return _instance;
  }

  AppCacheManager._() : super(Config(key,stalePeriod: const Duration(days: 7)));
}