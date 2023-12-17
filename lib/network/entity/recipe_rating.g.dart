// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeRatingEntity _$RecipeRatingEntityFromJson(Map<String, dynamic> json) =>
    RecipeRatingEntity(
      json['id'] as int?,
      json['name'] as String?,
      json['comment'] as String?,
      json['stars'] as int?,
      json['created_at'] as String?,
    );

Map<String, dynamic> _$RecipeRatingEntityToJson(RecipeRatingEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'comment': instance.comment,
      'stars': instance.stars,
      'created_at': instance.date,
    };
