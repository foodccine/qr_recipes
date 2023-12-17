// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryEntity _$CategoryEntityFromJson(Map<String, dynamic> json) =>
    CategoryEntity(
      json['id'] as int?,
      json['icon'] as String?,
      json['name'] as String?,
      json['category_parent'] == null
          ? null
          : CategoriesParentEntity.fromJson(
              json['category_parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryEntityToJson(CategoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'name': instance.name,
      'category_parent': instance.group,
    };
