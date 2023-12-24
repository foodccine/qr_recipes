// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandProductEntity _$BrandProductEntityFromJson(Map<String, dynamic> json) =>
    BrandProductEntity(
      json['id'] as int?,
      json['identifier'] as String?,
      json['name'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$BrandProductEntityToJson(BrandProductEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'identifier': instance.identifier,
      'name': instance.name,
      'image': instance.image,
    };
