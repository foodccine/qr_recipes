// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubtitleEntity _$SubtitleEntityFromJson(Map<String, dynamic> json) =>
    SubtitleEntity(
      json['id'] as int?,
      json['language'] == null
          ? null
          : LanguageEntity.fromJson(json['language'] as Map<String, dynamic>),
      json['file'] as String?,
    );

Map<String, dynamic> _$SubtitleEntityToJson(SubtitleEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'language': instance.language,
      'file': instance.file,
    };
