// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeEntity _$RecipeEntityFromJson(Map<String, dynamic> json) => RecipeEntity(
      json['id'] as int?,
      json['name'] as String?,
      json['image'] as String?,
      json['level'] as String?,
      json['views'] as int?,
      (json['category'] as List<dynamic>?)
          ?.map((e) => CategoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['time'] as int?,
      json['serving'] as int?,
      json['video'] == null
          ? null
          : VideoEntity.fromJson(json['video'] as Map<String, dynamic>),
      (json['ingredients'] as List<dynamic>?)
          ?.map((e) => IngredientEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['directions'] as List<dynamic>?)
          ?.map((e) => DirectionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['ratings'] as List<dynamic>?)
          ?.map((e) => RecipeRatingEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['type'] as String?,
    );

Map<String, dynamic> _$RecipeEntityToJson(RecipeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'level': instance.level,
      'views': instance.views,
      'category': instance.categories,
      'time': instance.time,
      'serving': instance.serving,
      'video': instance.video,
      'ingredients': instance.ingredients,
      'directions': instance.directions,
      'ratings': instance.ratings,
      'type': instance.type,
    };
