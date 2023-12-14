import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../presentation/resources/hive_manager.dart';
import '../../presentation/resources/keys_manager.dart';

part 'event.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveIDs.eventType)
class Event {
  @HiveField(0)
  @JsonKey(name: 'event_id')
  final int id;

  @HiveField(1)
  @JsonKey(name: 'guest_token')
  final String guestToken;

  @HiveField(2)
  @JsonKey(name: 'fcm_token')
  final String? fcmToken;

  @HiveField(3)
  @JsonKey(name: 'event_type')
  final String type;

  @HiveField(4)
  @JsonKey(name: 'event_timestamp')
  final String eventTimestamp;

  @HiveField(5)
  @JsonKey(name: 'event_data')
  final String? data;

  @HiveField(6)
  @JsonKey(name: 'country_name')
  final String? countryName;

  @HiveField(7)
  @JsonKey(name: 'country_code')
  final String? countryCode;

  @HiveField(8)
  @JsonKey(name: 'city_name')
  final String? city;

  @HiveField(9)
  @JsonKey(name: 'device_brand')
  final String? deviceBrand;

  @HiveField(10)
  @JsonKey(name: 'device_name')
  final String? deviceName;

  @HiveField(11)
  @JsonKey(name: 'os_name')
  final String? osName;

  @HiveField(12)
  @JsonKey(name: 'os_version')
  final String? osVersion;

  @HiveField(13)
  @JsonKey(name: 'app_version')
  final String? appVersion;

  @HiveField(14)
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? status = AppKeys.created;

  @HiveField(15)
  @JsonKey(name: 'server_timestamp')
  String? serverTimestamp;

  @HiveField(16)
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? trials = 0;

  @HiveField(17)
  @JsonKey(name: 'app_language')
  final String? appLanguage;

  Event(
    this.id,
    this.guestToken,
    this.fcmToken,
    this.type,
    this.eventTimestamp,
    this.data,
    this.countryName,
    this.countryCode,
    this.city,
    this.deviceBrand,
    this.deviceName,
    this.osName,
    this.osVersion,
    this.appVersion,
    this.serverTimestamp,
    this.appLanguage,
  );

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
