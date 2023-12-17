// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoEntity _$VideoEntityFromJson(Map<String, dynamic> json) => VideoEntity(
      json['id'] as int?,
      json['file'] as String?,
      json['subtitle'] == null
          ? null
          : SubtitleEntity.fromJson(json['subtitle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoEntityToJson(VideoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file': instance.file,
      'subtitle': instance.subtitle,
    };
