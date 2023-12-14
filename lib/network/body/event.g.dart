// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventAdapter extends TypeAdapter<Event> {
  @override
  final int typeId = 5;

  @override
  Event read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Event(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String?,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as String?,
      fields[12] as String?,
      fields[13] as String?,
      fields[15] as String?,
      fields[17] as String?,
    )
      ..status = fields[14] as String?
      ..trials = fields[16] as int?;
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.guestToken)
      ..writeByte(2)
      ..write(obj.fcmToken)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.eventTimestamp)
      ..writeByte(5)
      ..write(obj.data)
      ..writeByte(6)
      ..write(obj.countryName)
      ..writeByte(7)
      ..write(obj.countryCode)
      ..writeByte(8)
      ..write(obj.city)
      ..writeByte(9)
      ..write(obj.deviceBrand)
      ..writeByte(10)
      ..write(obj.deviceName)
      ..writeByte(11)
      ..write(obj.osName)
      ..writeByte(12)
      ..write(obj.osVersion)
      ..writeByte(13)
      ..write(obj.appVersion)
      ..writeByte(14)
      ..write(obj.status)
      ..writeByte(15)
      ..write(obj.serverTimestamp)
      ..writeByte(16)
      ..write(obj.trials)
      ..writeByte(17)
      ..write(obj.appLanguage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      json['event_id'] as int,
      json['guest_token'] as String,
      json['fcm_token'] as String?,
      json['event_type'] as String,
      json['event_timestamp'] as String,
      json['event_data'] as String?,
      json['country_name'] as String?,
      json['country_code'] as String?,
      json['city_name'] as String?,
      json['device_brand'] as String?,
      json['device_name'] as String?,
      json['os_name'] as String?,
      json['os_version'] as String?,
      json['app_version'] as String?,
      json['server_timestamp'] as String?,
      json['app_language'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'event_id': instance.id,
      'guest_token': instance.guestToken,
      'fcm_token': instance.fcmToken,
      'event_type': instance.type,
      'event_timestamp': instance.eventTimestamp,
      'event_data': instance.data,
      'country_name': instance.countryName,
      'country_code': instance.countryCode,
      'city_name': instance.city,
      'device_brand': instance.deviceBrand,
      'device_name': instance.deviceName,
      'os_name': instance.osName,
      'os_version': instance.osVersion,
      'app_version': instance.appVersion,
      'server_timestamp': instance.serverTimestamp,
      'app_language': instance.appLanguage,
    };
