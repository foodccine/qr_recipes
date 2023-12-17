// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectionEntity _$DirectionEntityFromJson(Map<String, dynamic> json) =>
    DirectionEntity(
      json['id'] as int?,
      json['image'] as String?,
      json['index'] as int?,
      json['text'] as String?,
      json['time'] as int?,
    );

Map<String, dynamic> _$DirectionEntityToJson(DirectionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'index': instance.index,
      'text': instance.text,
      'time': instance.time,
    };
