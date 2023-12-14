// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageEntity _$LanguageEntityFromJson(Map<String, dynamic> json) =>
    LanguageEntity(
      json['id'] as int?,
      json['name'] as String?,
      json['iso'] as String?,
      json['direction'] as String?,
    );

Map<String, dynamic> _$LanguageEntityToJson(LanguageEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iso': instance.iso,
      'direction': instance.direction,
    };
