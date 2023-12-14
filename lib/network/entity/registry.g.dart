// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      json['domain'] as String?,
      json['name'] as String?,
      json['type'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'domain': instance.domain,
      'name': instance.name,
      'type': instance.type,
    };

Flag _$FlagFromJson(Map<String, dynamic> json) => Flag(
      json['emoji'] as String?,
      json['emoji_unicode'] as String?,
      json['twemoji'] as String?,
      json['wikimedia'] as String?,
    );

Map<String, dynamic> _$FlagToJson(Flag instance) => <String, dynamic>{
      'emoji': instance.emoji,
      'emoji_unicode': instance.emoji_unicode,
      'twemoji': instance.twemoji,
      'wikimedia': instance.wikimedia,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      json['name'] as String?,
      json['code'] as String?,
      json['population'] as int?,
      json['calling_code'] as String?,
      json['flag'] == null
          ? null
          : Flag.fromJson(json['flag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'population': instance.population,
      'calling_code': instance.calling_code,
      'flag': instance.flag,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      json['city'] as String?,
      json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
    };

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      json['brand'] as String?,
      json['name'] as String?,
      json['type'] as String?,
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'brand': instance.brand,
      'name': instance.name,
      'type': instance.type,
    };

Os _$OsFromJson(Map<String, dynamic> json) => Os(
      json['name'] as String?,
      json['type'] as String?,
      json['version'] as String?,
    );

Map<String, dynamic> _$OsToJson(Os instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'version': instance.version,
    };

UserAgent _$UserAgentFromJson(Map<String, dynamic> json) => UserAgent(
      json['header'] as String?,
      json['device'] == null
          ? null
          : Device.fromJson(json['device'] as Map<String, dynamic>),
      json['os'] == null
          ? null
          : Os.fromJson(json['os'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserAgentToJson(UserAgent instance) => <String, dynamic>{
      'header': instance.header,
      'device': instance.device,
      'os': instance.os,
    };

Registry _$RegistryFromJson(Map<String, dynamic> json) => Registry(
      json['ip'] as String?,
      json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
      json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      json['user_agent'] == null
          ? null
          : UserAgent.fromJson(json['user_agent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegistryToJson(Registry instance) => <String, dynamic>{
      'ip': instance.ip,
      'company': instance.company,
      'location': instance.location,
      'user_agent': instance.user_agent,
    };
